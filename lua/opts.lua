local M = {}

vim.g.have_nerd_font = true

-- settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "" --mouse disabled
vim.o.cursorline = true
vim.o.showmode = false --show the current used mode
vim.o.fillchars = 'eob: '
vim.o.scrolloff = 11

--sync to the OS clipboard
vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

-- undo even after save
vim.o.undofile = true
vim.breakindent = true
vim.o.linebreak = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true

vim.o.inccommand = 'split'

vim.o.confirm = true

vim.o.autowrite = true
vim.o.expandtab = true
-- table indentation settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true

return M
