local M = {}

-- ---------- helpers ----------------------------------------------------
local function get_client(bufnr)
    local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "bqls" })
    return clients[1]
end

-- Pull a few interesting fields out of the markdown "Job info" block
-- that bqls returns in contents[1].value.
local function parse_job_info(md)
    if not md then
        return {}
    end
    return {
        job_id = md:match("^## Job (%S+)"),
        created = md:match("Created:%s*([^\n]+)"),
        ended = md:match("Ended:%s*([^\n]+)"),
        bytes_processed = md:match("Bytes processed:%s*([^\n]+)"),
        slot_ms = md:match("Slot milliseconds:%s*([^\n]+)"),
    }
end

local function cell_to_str(v)
    if v == nil or v == vim.NIL then
        return "NULL"
    elseif type(v) == "boolean" then
        return v and "true" or "false"
    else
        return tostring(v)
    end
end

local MAX_COL_WIDTH = 60
local COL_GAP = 2 -- spaces between columns

-- Build a plain, space-aligned table: header row, "----" separator, data rows.
local function build_table(columns, rows)
    local ncols = #columns
    local widths = {}
    for i, col in ipairs(columns) do
        widths[i] = math.min(MAX_COL_WIDTH, vim.fn.strdisplaywidth(col))
    end

    local str_rows = {}
    for _, row in ipairs(rows) do
        local sr = {}
        for i = 1, ncols do
            local s = cell_to_str(row[i])
            if vim.fn.strdisplaywidth(s) > MAX_COL_WIDTH then
                s = vim.fn.strcharpart(s, 0, MAX_COL_WIDTH - 1) .. "…"
            end
            sr[i] = s
            widths[i] = math.max(widths[i], vim.fn.strdisplaywidth(s))
        end
        table.insert(str_rows, sr)
    end

    local gap = string.rep(" ", COL_GAP)

    local function data_line(cells)
        local parts = {}
        for i = 1, ncols do
            local s = cells[i] or ""
            local pad = widths[i] - vim.fn.strdisplaywidth(s)
            -- last column: no trailing pad needed
            if i == ncols then
                table.insert(parts, s)
            else
                table.insert(parts, s .. string.rep(" ", pad))
            end
        end
        return table.concat(parts, gap)
    end

    local function sep_line()
        local parts = {}
        for i = 1, ncols do
            table.insert(parts, string.rep("-", widths[i]))
        end
        return table.concat(parts, gap)
    end

    local lines = {}
    table.insert(lines, data_line(columns))
    table.insert(lines, sep_line())
    for _, sr in ipairs(str_rows) do
        table.insert(lines, data_line(sr))
    end

    return lines
end

-- ---------- rendering ----------------------------------------------------

function M.show(payload)
    local job = parse_job_info(payload.contents and payload.contents[1] and payload.contents[1].value)
    local columns = payload.result and payload.result.columns or {}
    local data = payload.result and payload.result.data or {}

    if vim.tbl_isempty(columns) then
        vim.notify("Query returned no columns", vim.log.levels.WARN)
        return
    end

    local table_lines = build_table(columns, data)

    -- one-line metadata header: job id, processed, slot ms, row count
    local meta = {}
    if job.job_id then table.insert(meta, "job " .. job.job_id) end
    if job.bytes_processed then table.insert(meta, job.bytes_processed .. " processed") end
    if job.slot_ms then table.insert(meta, job.slot_ms .. " ms slot") end
    table.insert(meta, ("%d rows"):format(#data))

    local lines = {}
    table.insert(lines, table.concat(meta, "  |  "))
    table.insert(lines, "")
    vim.list_extend(lines, table_lines)

    -- ---- buffer ----
    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].filetype = "bqls-result"
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].modifiable = false

    -- ---- window: plain horizontal split, sized to content ----
    local height = math.min(#lines, math.floor(vim.o.lines * 0.6))
    vim.cmd("belowright " .. height .. "split")
    vim.api.nvim_win_set_buf(0, buf)
    vim.wo[0].wrap = false
    vim.wo[0].cursorline = true
    vim.wo[0].number = false
    vim.wo[0].signcolumn = "no"

    -- ---- minimal highlighting: just dim the metadata line and NULLs ----
    vim.api.nvim_buf_add_highlight(buf, -1, "Comment", 0, 0, -1)
    for i, l in ipairs(lines) do
        local s, e = l:find("NULL")
        if s then
            vim.api.nvim_buf_add_highlight(buf, -1, "Comment", i - 1, s - 1, e)
        end
    end

    -- ---- keymaps ----
    local opts = { buffer = buf, nowait = true, silent = true }
    vim.keymap.set("n", "q", "<cmd>close<CR>", opts)
    vim.keymap.set("n", "yy", function()
        local row = vim.fn.line(".") - 1
        vim.fn.setreg("+", vim.api.nvim_buf_get_lines(buf, row, row + 1, false)[1])
    end, opts)
end

-- ---------- driver ----------------------------------------------------

function M.run()
    local bufnr = vim.api.nvim_get_current_buf()
    local c = get_client(bufnr)

    if not c then
        vim.notify("bqls client not found", vim.log.levels.ERROR)
        return
    end

    local progress_token = "bqls-query-" .. tostring(vim.loop.hrtime())

    vim.notify("Running BigQuery query…", vim.log.levels.INFO)

    -- Tell Neovim/LSP that a long-running operation has started.
    vim.lsp.handlers["$/progress"](nil, {
        token = progress_token,
        value = {
            kind = "begin",
            title = "BigQuery",
            message = "Running query…",
            percentage = 0,
        },
    }, { client_id = c.id })

    c:request("workspace/executeCommand", {
        command = "bqls.executeQuery",
        arguments = {
            vim.uri_from_bufnr(bufnr),
        },
    }, function(err, result)
        if err then
            vim.lsp.handlers["$/progress"](nil, {
                token = progress_token,
                value = {
                    kind = "end",
                    message = "Query failed",
                },
            }, { client_id = c.id })


            vim.notify(
               "executeQuery error: " .. vim.inspect(err),
                vim.log.levels.ERROR
            )
            return
        end

        local uri = result
            and result.textDocument
            and result.textDocument.uri

        if not uri then
            vim.lsp.handlers["$/progress"](nil, {
                token = progress_token,
                value = {
                    kind = "end",
                    message = "No job URI returned",
                },
            }, { client_id = c.id })

            vim.notify(
                "No virtual document uri returned",
                vim.log.levels.ERROR
            )
            return
        end

        -- The executeQuery request has returned, but fetching the virtual
        -- document may still take a long time because bqls waits for BigQuery.
        vim.lsp.handlers["$/progress"](nil, {
            token = progress_token,
            value = {
                kind = "report",
                message = "Waiting for BigQuery result…",
                percentage = 50,
            },
        }, { client_id = c.id })

        c:request("bqls/virtualTextDocument", {
            textDocument = {
                uri = uri,
            },
        }, function(err2, payload)
            if err2 then
                vim.lsp.handlers["$/progress"](nil, {
                    token = progress_token,
                    value = {
                        kind = "end",
                        message = "Query failed",
                    },
                }, { client_id = c.id })

                vim.notify(
                    "virtualTextDocument error: " .. vim.inspect(err2),
                    vim.log.levels.ERROR
                )
                return
            end

            vim.lsp.handlers["$/progress"](nil, {
                token = progress_token,
                value = {
                    kind = "end",
                    message = "Query complete",
                },
            }, { client_id = c.id })

            vim.schedule(function()
                M.show(payload)
            end)

            -- Ask whether to save the result.
            vim.schedule(function()
                vim.ui.input({
                    prompt = "Save result to file (empty = don't save): ",
                    default = "",
                    completion = "file",
                }, function(filename)
                    if not filename or filename == "" then
                        return
                    end

                    local path = filename

                    if not vim.startswith(path, "/") then
                        path = vim.fs.joinpath(vim.fn.getcwd(), path)
                    end

                    local file_uri = vim.uri_from_fname(path)

                    c:request("workspace/executeCommand", {
                        command = "bqls.saveResult",
                        arguments = {
                            uri,
                            file_uri,
                        },
                    }, function(err3, _)
                        if err3 then
                            vim.notify(
                                "saveResult error: " .. vim.inspect(err3),
                                vim.log.levels.ERROR
                            )
                            return
                        end

                        vim.notify(
                            "Result saved to " .. path,
                            vim.log.levels.INFO
                        )
                    end, bufnr)
                end)
            end)
        end, bufnr)
    end, bufnr)
end

function M.setup(opts)
    opts = opts or {}
    vim.keymap.set("n", opts.keymap or "<leader>bq", M.run, { desc = "Run BigQuery query (bqls)" })
end

return M
