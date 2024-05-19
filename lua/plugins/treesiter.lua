return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		 require("nvim-treesitter.configs").setup({
		 modules = {
			 "c",
			 "cpp",
			 "lua",
			 "vim",
			 "vimdoc",
			 "query",
			 "markdown",
			 "markdown_inline",
			 "bash",
			 "c_sharp",
			 "cmake",
			 "comment",
			 "css",
			 "scss",
			 "dockerfile",
			 "html",
			 "hyprlang",
			 "javascript",
			 "svelte",
			 "typescript",
			 "json",
			 "meson",
			 "python",
			 "regex",
			 "rust",
			 "toml",
			 "yaml",
			 "yuck"
		 },
		 ensure_installed = {
			 "markdown",
			 "markdown_inline"
		 },
		 ignore_install = { },
		 sync_install = false,
	   -- set to false if you don't have `tree-sitter` CLI installed locally
		 auto_install = true
	 })
	end
}
