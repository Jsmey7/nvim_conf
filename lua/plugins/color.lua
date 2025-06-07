return {
	{
		"folke/tokyonight.nvim",
		config = function() end,
	},
	{
		"Mofiqul/vscode.nvim",
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vscode").setup({
				-- optional configuration here
			})
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		config = function()
			vim.g.everforest_enable_italic = true
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function() end,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		config = function() end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function() end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_background = "soft"
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		config = function() end,
	},
	{
		"metalelf0/black-metal-theme-neovim",
		config = function()
			require("black-metal").setup({
				-- optional configuration here
			})
		end,
	},
}
