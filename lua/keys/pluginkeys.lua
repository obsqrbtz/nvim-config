require("keys.alias")

vim.g.mapleader = ' '

-- DAP
nm('<F5>', "<Cmd>lua require'dap'.continue()<CR>")
nm('<F10>', "<Cmd>lua require'dap'.step_over()<CR>")
nm('<F11>', "<Cmd>lua require'dap'.step_into()<CR>")
nm('<F12>', "<Cmd>lua require'dap'.step_out()<CR>")
nm('<Leader>b', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")

--Telescope
nm('<Leader>fd', "<Cmd>lua require('telescope.builtin').fd()<CR>")
nm('<Leader>fg', "<Cmd>lua require('telescope.builtin').live_grep()<CR>")
nm('<Leader>fb', "<Cmd>lua require('telescope.builtin').buffers()<CR>")
