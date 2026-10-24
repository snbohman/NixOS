local wilder = require("wilder")

wilder.setup({ modes = { ":" } })

wilder.set_option("pipeline", {
    wilder.branch(
        wilder.python_file_finder_pipeline({
            file_command = {
                "fd", "-tf", "-H",
                "-E", "build", "-E", "bin", "-E", "external",
                "-E", ".git", "-E", "__pycache__", "-E", "node_modules",
                "-E", "target", "-E", "dist", "-E", "*.o", "-E", "*.so",
                "-E", "*.pyc",
            },
            dir_command = { "fd", "-td", "-H", "-E", ".git", "-E", "node_modules" },
            filters = { "cpsm_filter" },
        }),
        wilder.cmdline_pipeline({ fuzzy = 1 })
    ),
})

wilder.set_option("renderer", wilder.wildmenu_renderer({
    highlighter = wilder.basic_highlighter(),
}))
