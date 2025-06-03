vim.g.mapleader = ' ' 
vim.g.maplocalleader = ' ' 

-- plugins
-- lazy.nvim

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
      -- add plugins here
      {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 800, -- make sure to load this before all the other start plugins
        config = function()
        end,

      },
      {
          "lewis6991/gitsigns.nvim",
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
          priority = 1000,
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
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
      },
      {
        'akinsho/bufferline.nvim', 
        version = "*", 
        dependencies = 'nvim-tree/nvim-web-devicons'
      },
      {
          "folke/zen-mode.nvim",
          opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
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
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 800, -- make sure to load this before all the other start plugins
        config = function()
        end,  
      },
      { 
          "ellisonleao/gruvbox.nvim", 
          priority = 1000 , 
          config = true, 
      },
      {
        'nvim-lualine/lualine.nvim',
        name = "lualine",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = false,
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'auto',
                    icons_enabled = true,
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    refresh = {
                        statusline = 100,
                        tabline = 100,
                        winbar = 100,
                    }
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'filetype'},
                    lualine_y = {},
                    lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
            })
        end,
      },
      {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        vim.g.gruvbox_material_enable_italic = true
        vim.cmd.colorscheme('gruvbox-material')
      end,
    },
    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("telescope").setup({
              pickers = {
                colorscheme = {
                  enable_preview = true,
                },
              },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate"
    },

    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    -- more plugins
  },
  install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
})


vim.g.have_nerd_font = true
vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', {desc = 'Toggle zen mode', silent = true})

-- settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "" --mouse disabled
vim.o.cursorline = true
vim.o.showmode = false --show the current used mode
vim.o.fillchars = 'eob: '
vim.o.scrolloff = 13

--sync to the OS clipboard
vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

-- undo even after save
vim.o.undofile = true
vim.breakindent = true
vim.o.linebreak = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true

vim.o.inccommand = 'split'

vim.o.confirm = true

vim.o.autowrite = true
vim.o.expandtab = true
-- table indentation settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true

-- key remaps
--
-- goto
vim.keymap.set('n', 'gl', '$', {desc = 'goto end of line'})
vim.keymap.set('n', 'gh', '^', {desc = 'goto start of line'})
vim.keymap.set('n', 'ge', 'G', {desc = 'goto end of file'})
vim.keymap.set('n', 'miw', 'viw', { desc = "Select inner word (like Helix)" })

-- move selected area up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = 'move selected area down'})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = 'move selected area up'})


vim.keymap.set("n", "x", "V", {desc = 'select line in visual mode'})
vim.keymap.set('x', '>', '>gv', { noremap = true, silent = true, desc = 'Indent and reselect' })
vim.keymap.set('x', '<', '<gv', { noremap = true, silent = true, desc = 'Indent and reselect' })
vim.keymap.set('x', 'v', '<C-c>', { noremap = true, silent = true, desc = 'exit select mode to normal mode' })
vim.keymap.set('x', 'x', '<C-c>', { noremap = true, silent = true, desc = 'exit select mode to normal mode' })

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>th', function()
    require('telescope.builtin').colorscheme()
end, {desc = "Switch color scheme"})







