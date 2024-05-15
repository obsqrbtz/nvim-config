## Dependencies

- [ripgrep](https://github.com/BurntSushi/ripgrep) - for `Telescope`
- [fd](https://github.com/sharkdp/fd) - for `Telescope`
- [csharp-ls](https://github.com/razzmatazz/csharp-language-server) - .NET analyzers

	```bash
	dotnet tool install --global csharp-ls)
	```
- [netcoredbg](https://github.com/razzmatazz/csharp-language-server) - for .NET debugging
- a `C` compiler for compiling treesitter parsers
		
	```
	"cc", "gcc", "clang", "cl", "zig"
	```
- any nerd font
