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
					 require("lspconfig")["csharp_ls"].setup({}),
					 require("lspconfig")["lua_ls"].setup({
						 settings = {
						 },
					 }),
					 require("lspconfig")["pylsp"].setup({
						 capabilities = caps,
					 }),
					 ensure_installed = {
						 "lua_ls",
						 "pylsp",
						 "omnisharp"
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
        vim.diagnostic.config(config)
	end,
}