local M = {}

M.plugins = function(use) 
    use({
        'nvim-treesitter/nvim-treesitter', 
    })
end

M.setup = function() 
    local lang = {
        "bash",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "regex",
        "scss",
        "scss",
        "tsx",
        "typescript",
        "vim",
        "yaml",
    }

    require('nvim-treesitter.configs').setup{
        ensure_installed = lang,
        highlight = {
            enable = true,
            disable = { },
        },
        autopairs = {
            enable = true,
        },
        indent = {
            enable = true,
            disable = {},
        },
        context_commentstring = {
            enable = true,
            commentary_integration = {
                -- change default mapping
                Commentary = 'g/',
                -- disable default mapping
                CommentaryLine = false,
            },
        }
    }

end

return M
