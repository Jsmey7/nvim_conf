return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			triggers = {
				{ "<auto>", mode = "nixsotc" },
				{ "d", mode = { "n", "v" } },
				{ "y", mode = { "n", "v" } },
				{ "g", mode = { "n" } },
				{ "m", mode = { "n" } },
				{ "<C-w>", mode = { "n" } },
			},
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
