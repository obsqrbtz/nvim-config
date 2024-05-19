## Requirements

- [ripgrep](https://github.com/BurntSushi/ripgrep) - for `Telescope`
- [fd](https://github.com/sharkdp/fd) - for `Telescope`
- [csharp-ls](https://github.com/razzmatazz/csharp-language-server) - `.NET` analyzers

	```bash
	dotnet tool install --global csharp-ls
	```
- [netcoredbg](https://github.com/Samsung/netcoredbg) - for `.NET` debugging
- a `C` compiler for compiling treesitter parsers
		
	```
	"cc", "gcc", "clang", "cl", "zig"
	```
- clangd - `C++`, `C` and `Rust` debugging (not configured properly yet, remove from `lspconfig.lua` if you are not going to set it up youreself)
- lldb-vscode (same as previous entry - remove from `dap.lua` if are not going to mess with configs. AUR package is broken, so manual intervention is needed)
- [hyprls](https://github.com/hyprland-community/hyprls) - `hyprlang` LSP
- any nerd font
