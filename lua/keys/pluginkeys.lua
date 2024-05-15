require("keys.alias")

nm('<F5>', "<Cmd>lua require'dap'.continue()<CR>")
nm('<F10>', "<Cmd>lua require'dap'.step_over()<CR>")
nm('<F11>', "<Cmd>lua require'dap'.step_into()<CR>")
nm('<F12>', "<Cmd>lua require'dap'.step_out()<CR>")
nm('<Leader>b', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
