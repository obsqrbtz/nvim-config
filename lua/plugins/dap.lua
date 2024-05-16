return{
	'mfussenegger/nvim-dap',
	config = function ()
		local dap = require("dap")
		dap.adapters.coreclr = {
			type = "executable",
			command = "netcoredbg", -- TODO: symlinc "/usr/local/netcoredbg" to /usr/bin on linux
			args = {"--interpreter=vscode"}
		}
		dap.configurations.cs = {
			{
			type = "coreclr",
			name = "launch - netcoredbg",
			request = "launch",
			program = function()
				return vim.fn.input('Path do dll', vim.fn.getcwd() .. '\\bin\\Debug\\', 'file')
			end,
		}
	}
	end
}
