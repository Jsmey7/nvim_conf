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
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			-- Example configurations (tsserver will be picked up by mason-lspconfig)
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({
				settings = {
					clangd = {
						arguments = {
							"-std=c++23",
							-- other clangd arguments if needed
						},
					},
				},
				filetypes = { "c", "cpp", "h", "hpp", "hxx", "cxx" },
			})
			lspconfig.rust_analyzer.setup({})
			lspconfig.ts_ls.setup({}) -- Ensure tsserver is setup here
			-- ... other lspconfig setups
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"clangd",
					"gopls",
					"pylsp",
					"pyrefly",
					"java_language_server",
					"ts_ls",
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup()
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "python", "codelldb", "delve" },
				automatic_setup = true,
			})
		end,
	},
}
