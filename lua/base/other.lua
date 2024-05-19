local opt = vim.opt
local g = vim.g

opt.splitright = true
opt.splitbelow = true

opt.clipboard = 'unnamedplus'
opt.fixeol = false
opt.completeopt = 'menuone,noselect'
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.termguicolors = true

-- Disable autocomment on enter
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]
