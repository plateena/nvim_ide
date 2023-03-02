local function plugins(use)
    use({
        "folke/todo-comments.nvim",
        "machakann/vim-sandwich",
        { "mattn/emmet-vim", ft = { "blade", "html", "css"}},
        "rafamadriz/friendly-snippets",
        'JoosepAlviste/nvim-ts-context-commentstring',
        'numToStr/Comment.nvim',
        "lambdalisue/suda.vim",
        -- 'tpope/vim-commentary',
        { 'phaazon/hop.nvim', disable = true, branch = 'v2' },

        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        {
            'prettier/vim-prettier', 
            run = 'npm install --frozen-lockfile --production'
        },
    })
end

return { plugins = plugins }
