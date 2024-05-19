return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{
			"j-hui/fidget.nvim", -- LSP notifications
			tag = "legacy",
			event = "LspAttach",
		},
		"folke/neodev.nvim",
		"RRethy/vim-illuminate", -- highlight other uses of the word under the cursor
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		require("mason").setup({
			PATH = "prepend", -- "skip" seems to cause the spawning error
		})
		local caps = require("cmp_nvim_lsp")
				.default_capabilities(vim.lsp.protocol
					.make_client_capabilities())
		require("mason-lspconfig").setup({
			require("lspconfig")["csharp_ls"].setup({
				capabilities = caps
			}),
			require("lspconfig")["bashls"].setup({
				capabilities = caps
			}),
			require("lspconfig")["cssls"].setup({
				capabilities = caps
			}),
			require("lspconfig")["neocmake"].setup({
				capabilities = caps
			}),
			require("lspconfig")["lua_ls"].setup({
				capabilities = caps,
				settings = {
				},
			}),
			require("lspconfig")["pylsp"].setup({
				capabilities = caps
			}),
			require("lspconfig")["html"].setup({
				capabilities = caps
			}),
			require("lspconfig")["tsserver"].setup({
				capabilities = caps
			}),
			require("lspconfig")["marksman"].setup({
				capabilities = caps
			}),
			require("lspconfig")["mesonlsp"].setup({
				capabilities = caps
			}),
			require("lspconfig")["rust_analyzer"].setup({
				capabilities = caps
			}),
			require("lspconfig")["svelte"].setup({
				capabilities = caps
			}),
			require("lspconfig")["tailwindcss"].setup({
				capabilities = caps
			}),
			require("lspconfig")["gitlab_ci_ls"].setup({
				capabilities = caps
			}),
			require("lspconfig")["clangd"].setup({}),
			capabilities = caps,
			ensure_installed = {
				"lua_ls",
				"pylsp",
				"csharp_ls",
				"clangd",
				"bashls",
				"neocmake",
				"cssls",
				"html",
				"gitlab_ci_ls",
				"tsserver",
				"marksman",
				"mesonlsp",
				"rust_analyzer",
				"svelte",
				"tailwindcss"
			},
			automatic_installation = true,
		})
		require("fidget").setup()
		-- Set up cool signs for diagnostics
		local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
		-- Diagnostic config
		local config = {
			virtual_text = false,
			signs = {
				active = signs,
			},
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}
		-- Hyprlang LSP
		local home = os.getenv( "HOME" )
		vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
			pattern = {"*.hl", "hypr*.conf"},
			callback = function(event)
				print(string.format("starting hyprls for %s", vim.inspect(event)))
				vim.lsp.start {
						name = "hyprlang",
						autostart = true,
						cmd = {home .. "/go/bin/hyprls"},
						root_dir = vim.fn.getcwd(),
				}
			end
		})
		vim.filetype.add({
  		pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
		})
		vim.diagnostic.config(config)
	end,
}
