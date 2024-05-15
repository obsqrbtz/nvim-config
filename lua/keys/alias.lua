local map = vim.api.nvim_set_keymap

-- normal
function nm(key, command) 
	map('n', key, command, {noremap = true, silent = true})
end

-- input
function im(key, command)
	map('i', key, command, {noremap = true})
end

-- visual
function vm(key, command)
	map('v', key, command, {noremap = true})
end

-- terminal
function tm(key, command)
	map('t', key, command, {noremap = true})
end

