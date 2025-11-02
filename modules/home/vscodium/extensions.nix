{ pkgs, ... }:
{
  programs.vscode.profiles.default = {
    extensions = with pkgs.vscode-extensions; [
      ## Languages
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      # ms-python.python
      llvm-vs-code-extensions.vscode-clangd
      ziglang.vscode-zig
      tamasfe.even-better-toml
      golang.go

      # nav
      vscodevim.vim

      ## Color scheme
      jdinhlife.gruvbox
    ];
  };
}
