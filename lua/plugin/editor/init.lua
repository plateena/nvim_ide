local M = {}

local modules = {}

local plugs = {
    "folke/todo-comments.nvim",
    "machakann/vim-sandwich",
    { "mattn/emmet-vim", ft = { "blade", "html", "css"}},
    "rafamadriz/friendly-snippets",
    'JoosepAlviste/nvim-ts-context-commentstring',
    {
        'numToStr/Comment.nvim', config = function()
            require('Comment').setup()
        end
    },
    "lambdalisue/suda.vim",
    -- 'tpope/vim-commentary',
    { 'phaazon/hop.nvim', disable = true, branch = 'v2' },

    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    {
        'prettier/vim-prettier', 
        run = 'npm install --frozen-lockfile --production'
    },
}

M.plugins = function(use)
    setupPlugins(use, plugs, modules, basePath)
end


return M
