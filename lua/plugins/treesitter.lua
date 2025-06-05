return {

    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",
        config= function()
            require'nvim-treesitter.configs'.setup {
              ensure_installed = { 
                  "c", "lua", "vim", 
                  "vimdoc", "query", "markdown", 
                  "markdown_inline", "cpp", "rust",
                  "python", "javascript", "java",
                  "go", "html", "css", "xml", 
                  "json", "asm", "bash",
                  "csv", "cuda", "cmake",
                  "haskell", "regex", "sql",
                  "toml", "typescript", "zig",
                  "yaml"
              },
          }
      end,
    }
}
