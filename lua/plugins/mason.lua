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
			lspconfig.ts_ls.setup({})
			lspconfig.zls.setup({})
			-- ... other lspconfig setups
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		-- Load when opening/creating any file (most common for LSP setup)
		event = { "BufReadPre", "BufNewFile" },
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
					"zls",
				},
			})
		end,
	},
	-- {
	-- 	"mfussenegger/nvim-dap",
	-- 	cmd = { "DapContinue", "DapTerminate", "DapToggleBreakpoint", "DapStepInto", "DapStepOver", "DapStepOut" },
	-- 	dependencies = {
	-- 		"rcarriga/nvim-dap-ui",
	-- 		"theHamsta/nvim-dap-virtual-text",
	-- 		"mason-org/mason.nvim",
	-- 	},
	-- 	config = function()
	-- 		local dap = require("dap")
	-- 		require("nvim-dap-virtual-text").setup()
	-- 		dap.adapters.codelldb = {
	-- 			type = "executable",
	-- 			command = "/home/josh/.local/share/nvim/mason/packages/codelldb/codelldb", -- codelldb path (from mason)
	-- 		}
	-- 		dap.configurations.cpp = {
	-- 			{
	-- 				name = "Launch file",
	-- 				type = "codelldb",
	-- 				request = "launch",
	-- 				program = function()
	-- 					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
	-- 				end,
	-- 				cwd = "${workspaceFolder}",
	-- 				stopOnEntry = false,
	-- 			},
	-- 		}
	-- 		dap.configurations.rust = {
	-- 			{
	-- 				name = "Launch file",
	-- 				type = "codelldb",
	-- 				request = "launch",
	-- 				program = function()
	-- 					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
	-- 				end,
	-- 				cwd = "${workspaceFolder}",
	-- 				stopOnEntry = false,
	-- 			},
	-- 		}
	-- 	end,
	-- },
	-- {
	-- 	"rcarriga/nvim-dap-ui",
	-- 	cmd = { "DapUIOpen", "DapUIClose", "DapUIToggle" },
	-- 	dependencies = {
	-- 		"nvim-dap",
	-- 		"nvim-neotest/nvim-nio",
	-- 	},
	-- 	config = function()
	-- 		require("dapui").setup()
	-- 	end,
	-- },
	-- -- { already calling setup from nvim_dap
	-- -- 	"theHamsta/nvim-dap-virtual-text",
	-- -- 	config = function() end,
	-- -- },
	-- {
	-- 	"jay-babu/mason-nvim-dap.nvim",
	-- 	cmd = {
	-- 		"DapInstall",
	-- 		"DapUninstall",
	-- 		"DapUpdate", -- Mason-DAP commands
	-- 		"DapContinue",
	-- 		"DapToggleBreakpoint", -- Common nvim-dap commands that will trigger it
	-- 	},
	-- 	dependencies = {
	-- 		"mason-org/mason.nvim",
	-- 		"mfussenegger/nvim-dap",
	-- 	},
	-- 	config = function()
	-- 		require("mason-nvim-dap").setup({
	-- 			ensure_installed = { "debugpy", "codelldb", "delve", "cpptools" },
	-- 			automatic_setup = true,
	-- 		})
	-- 	end,
	-- },
}
