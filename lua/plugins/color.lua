
return {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 800, -- make sure to load this before all the other start plugins
        config = function()
        end,

    },
    {
        "datsfilipe/vesper.nvim",
        config = function()
        require("vesper").setup({
            -- optional configuration here
        })
        end,
    },
    {
      "shaunsingh/nord.nvim",
      config = function()
        -- NOTE: you do not need to call setup if you don't want to.
        require("gitsigns").setup({
          -- optional configuration here
        })
      end,
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
          "xero/miasma.nvim",
          config = function()
          end,
      },
      {
          "miikanissi/modus-themes.nvim",
          config = function()
            -- NOTE: you do not need to call setup if you don't want to.
            require("modus-themes").setup({
              -- optional configuration here
            })
          end,
      },
      {
          "vague2k/vague.nvim",
          config = function()
            -- NOTE: you do not need to call setup if you don't want to.
            require("vague").setup({
              -- optional configuration here
            })
          end,
      },
      {
          'sainnhe/everforest',
          lazy = false,
          config = function()
            vim.g.everforest_enable_italic = true
          end,
      },
      {
        "catppuccin/nvim", 
        name = "catppuccin",
        config = function()
        end,
      },
      {
          "Koalhack/darcubox-nvim",
          config = function()  
          end,
      },
      {
        "rebelot/kanagawa.nvim", 
        name = "kanagawa",
        config = function()
        end,
      },
      {
          "bluz71/vim-moonfly-colors",
          name = "moonfly",
          config = function()
          end,
      },
      {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        config = function()
        end,
      },
      { 
          "ellisonleao/gruvbox.nvim", 
          config = true, 
      },
      {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_background = "soft"
        vim.cmd.colorscheme('gruvbox-material')
      end,
    },
    {
      'projekt0n/github-nvim-theme',
      lazy = false,
      config = function()
      end,
    },
    {
      'metalelf0/black-metal-theme-neovim',
      lazy = false,
      config = function()
        require("black-metal").setup({
      -- optional configuration here
        })
      end,
    }
}


