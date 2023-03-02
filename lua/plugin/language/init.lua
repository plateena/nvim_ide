local M = {}
M.plugins = function(use)
    use({
        { "jose-elias-alvarez/typescript.nvim",
        disable = true,
        ft = {"ts"},
        setup = function()
            require("typescript").setup({})
        end
    },
    {
        'noahfrederick/vim-laravel',
        ft = {"php"}
    },
    {
        'phpactor/phpactor',
        tag = '*',
        run = 'composer install --no-dev -o',
        ft = {"php"}

    }
})
end

return M
