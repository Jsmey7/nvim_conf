vim.loader.enable()
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.termguicolors = true
vim.g.ai_cmp = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			import = "plugins",
		},
	},

	checker = { enabled = true },
})

require("opts")
require("keymaps")
require("telescope_conf")
vim.cmd.colorscheme("zenbones")

vim.diagnostic.config({
	update_in_insert = true,
	signs = true,
	severity_sort = true,
})
vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { fg = "#666666", italic = true, blend = 85 })
