return {

	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"stylua",
					"jq",
					"black",
					"isort",
					"rustfmt",
					"prettierd",
					"prettier",
					"clang-format",
					"goimports",
					"google-java-format",
				},
			})
		end,
	},
}
