local M = {}
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED
vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "add buffer to harpoon list" })

vim.keymap.set("n", "<C-u>", function()
	harpoon:list():select(1)
end, { desc = "open harpoon window 1" })
vim.keymap.set("n", "<C-i>", function()
	harpoon:list():select(2)
end, { desc = "open harpoon window 2" })
vim.keymap.set("n", "<C-o>", function()
	harpoon:list():select(3)
end, { desc = "open harpoon window 4" })
vim.keymap.set("n", "<C-p>", function()
	harpoon:list():select(4)
end, { desc = "open harpoon window 4" })

vim.keymap.set("n", "<leader>hp", function()
	harpoon:list():prev()
end, { desc = "Prev harpoon window" })
vim.keymap.set("n", "<leader>hn", function()
	harpoon:list():next()
end, { desc = "Next harpoon window" })

vim.keymap.set("n", "<C-h>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "toggle harpoon menue" })
return M
