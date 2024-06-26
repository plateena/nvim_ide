local M = {}

local basePath = "plugin.editor."

local modules = {}

local plugs = {
    {
        "folke/todo-comments.nvim",
        config = function()
            require('todo-comments').setup({})
        end
    },
    "machakann/vim-sandwich",
    { "mattn/emmet-vim", ft = { "blade", "html", "css"}},
    "rafamadriz/friendly-snippets",
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function() 
            require("nvim-treesitter.configs").setup({
                context_commentstring = {
                    enable = true,
                }
            })
        end
    },
    {
        'numToStr/Comment.nvim', config = function()
            require('Comment').setup()
        end
    },
    "lambdalisue/suda.vim",
    -- 'tpope/vim-commentary',
    -- { 'phaazon/hop.nvim', disable = true, branch = 'v2' },

    'hrsh7th/cmp-vsnip',
    { 'hrsh7th/vim-vsnip', 
        config = function() 
            vim.cmd("let g:vsnip_snippet_dir='~/.config/nvim/snippet'")
        end,
    },
    {
        'prettier/vim-prettier', 
        run = 'npm install --frozen-lockfile --production',
    },
}

M.plugins = function(use)
    setupPlugins(use, plugs, modules, basePath)
end


return M
