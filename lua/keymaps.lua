local M = {}

local opts = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

vim.api.nvim_set_hl(0, "WinSeparator", { link = "Normal", bold = true })
vim.keymap.set("n", "<C-w>o", ":SimpleZoomToggle<CR>", opts("zoom into window while preserving the layout"))

vim.keymap.set("n", "<C-c><C-c>", ":nohlsearch<CR>", opts("remove highlighting search"))
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", opts("remove highlighting search"))

--terminal

vim.keymap.set(
	"n",
	"<leader>tt",
	":vnew<CR>:terminal<CR>:vertical resize -28<CR>a",
	opts("open small treminal on the right side")
)
vim.keymap.set(
	"n",
	"<leader>tl",
	":vnew<CR>:terminal<CR>:vertical resize -5<CR>a",
	opts("open large treminal on the right side")
)

vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", opts("window mode (switch between windows with ljkh)"))
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", opts("switch to command mode from terminal mode"))

vim.keymap.set("t", "<C-k>", "exit<CR>", opts("kill terminal (from terminal mode)"))
vim.keymap.set("n", "<C-k>", ":q<CR>", opts("kill treminal or any buffer from normal mode"))

-- sorround
vim.keymap.set("n", "miw", "viw", opts("sorround select inside word"))
vim.keymap.set("n", "maw", "vaw", opts("sorround select around word"))
--
-- comment

local api = require("Comment.api")
local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

vim.keymap.set("n", "<C-_>", function()
	require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })

vim.keymap.set("x", "<C-_>", function()
	vim.api.nvim_feedkeys(esc, "nx", false)
	api.toggle.linewise(vim.fn.visualmode())
end)

-- buffers
vim.keymap.set("n", "gn", ":bnext<CR>", opts("next buffer"))
vim.keymap.set("n", "gp", ":bprevious<CR>", opts("previous buffer"))
vim.keymap.set("n", "<leader>bc", ":bdelete<CR>", opts("delete buffer"))

--oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- goto
vim.keymap.set("n", "gl", "$", opts("goto end of line"))
vim.keymap.set("n", "gh", "^", opts("goto start of line"))
vim.keymap.set("n", "ge", "G", opts("goto end of file"))
vim.keymap.set("n", "gy", "0", opts("goto start of line before indentation"))
vim.keymap.set("n", "gj", "}", opts("go to next peragraph"))
vim.keymap.set("n", "gk", "{", opts("go to previous peragraph"))

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
vim.keymap.set("v", "a", "<C-c>a", opts("exit visual mode to insert mode"))
vim.keymap.set("v", "i", "<C-c>i", opts("exit visual mode to insert mode"))
vim.keymap.set("v", "o", "<C-c>o", opts("exit visual mode to insert mode"))

--goto visual mode
vim.keymap.set("v", "gl", "$", opts("goto start of line"))
vim.keymap.set("v", "gh", "^", opts("goto end of line"))
vim.keymap.set("v", "ge", "G", opts("goto end of file"))
vim.keymap.set("v", "gy", "0", opts("goto start of line before indentation"))

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

-- debugging
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts("toggle breakpoint"))
vim.keymap.set("n", "<leader>dt", ":DapVirtualTextToggle<CR>", opts("toggle debugging veirtual text"))
vim.keymap.set("n", "<leader>dcb", ":DapClearBreakpoints<CR>", opts("clear break points"))
vim.keymap.set("n", "<leader>dui", ":lua require('dapui').toggle()<CR>", opts("toggle nvim dap ui"))
vim.keymap.set("n", "<leader>dur", ":lua require('dapui').open({reset = true})<CR>", opts("restart dapui"))
vim.keymap.set("n", "<F1>", ":DapContinue<CR>", opts("continue (debugging)"))
vim.keymap.set("n", "<F2>", ":DapStepOver<CR>", opts("step over (debugging)"))
vim.keymap.set("n", "<F3>", ":DapStepOut<CR>", opts("step out (debugging)"))
vim.keymap.set("n", "<F4>", ":DapStepInto<CR>", opts("step into (debugging)"))
vim.keymap.set("n", "<F13>", ":DapRestartFrame<CR>", opts("restart frame (debugging)"))

-- helix like yank
vim.keymap.set("x", "y", "ygv<Esc>", opts("copy selected text"))

-- marks
vim.keymap.set("n", "<leader>md", ":delmarks a-z <CR>", opts("delte all local marks"))
vim.keymap.set("n", "<leader>mda", ":delmarks a-zA-Z <CR>", opts("delte all marks"))

return M
