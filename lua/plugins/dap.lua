return{
	'mfussenegger/nvim-dap',
	config = function ()
		local dap = require("dap")
		dap.adapters.coreclr = {
			type = "executable",
			command = "netcoredbg",
			args = {"--interpreter=vscode"}
		}
		dap.adapters.lldb = {
			type = 'executable',
			command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
			name = 'lldb'
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
	dap.configurations.cpp = {
  	{
    	name = 'Launch',
    	type = 'lldb',
    	request = 'launch',
    	program = function()
      	return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    	end,
    	cwd = '${workspaceFolder}',
    	stopOnEntry = false,
    	args = {}
		}
	}
	dap.configurations.c = dap.configurations.cpp
	dap.configurations.rust = dap.configurations.cpp
	end
}
