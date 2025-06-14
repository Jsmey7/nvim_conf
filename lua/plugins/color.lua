return {
	{
		"Mofiqul/vscode.nvim",
		event = "VeryLazy",
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
		event = "VeryLazy",
		config = function() end,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		event = "VeryLazy",
		config = function() end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		event = "VeryLazy",
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
		event = "VeryLazy",
		config = function()
			require("black-metal").setup({
				-- optional configuration here
			})
		end,
	},
}
