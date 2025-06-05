local M = {}

local opts = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

vim.api.nvim_set_hl(0, "WinSeparator", { link = "Normal", bold = true })

-- goto
vim.keymap.set("n", "gl", "$", opts("goto start of line"))
vim.keymap.set("n", "gh", "^", opts("goto end of line"))
vim.keymap.set("n", "ge", "G", opts("goto end of file"))
vim.keymap.set("n", "gb", "0", opts("goto start of line before indentation"))
vim.keymap.set("n", "gj", "}", opts("go to next peragraph"))
vim.keymap.set("n", "gk", "{", opts("go to previous peragraph"))
vim.keymap.set("n", "miw", "viw", opts("select inner word (like helix)"))

vim.keymap.set("n", "p", "p`]", opts("paste and keep the cursor at the end"))

-- move selected area up and down
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", opts("move selected area down"))
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", opts("move selected area up"))

-- indent selected area
vim.keymap.set("x", ">", ">gv", opts("Indent and reselect"))
vim.keymap.set("x", "<", "<gv", opts("Indent and reselect"))
-- visual mode
vim.keymap.set("n", "x", "V", opts("select line in visual mode"))
vim.keymap.set("x", "v", "<C-c>", opts("exit visual mode to normal mode"))
vim.keymap.set("x", "x", "<C-c>", opts("exit visual mode to normal mode"))

-- window managment
vim.keymap.set("n", "<C-w>h", "<cmd>wincmd h<cr>", opts("goto left window"))
vim.keymap.set("n", "<C-w>j", "<cmd>wincmd j<cr>", opts("goto down window"))
vim.keymap.set("n", "<C-w>k", "<cmd>wincmd k<cr>", opts("goto up window"))
vim.keymap.set("n", "<C-w>l", "<cmd>wincmd l<cr>", opts("goto right window"))
vim.keymap.set("n", "<C-w>v", "<cmd>vsplit<cr>", opts("vertical window split"))
vim.keymap.set("n", "<C-w>s", "<cmd>split<cr>", opts("horizontal window split"))

vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize +2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize -2<cr>", { desc = "Increase window width" })
vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Balance window sizes" })

-- color scheme switcher
vim.keymap.set("n", "<leader>th", function()
	require("telescope.builtin").colorscheme()
end, opts("Switch color scheme"))

return M
