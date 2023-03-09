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
            'noahfrederick/vim-composer',
            ft = {"php"}
        },
        -- {
        --     'phpactor/phpactor',
        --     tag = '137b6a0',
        --     run = 'composer install --no-dev -o',
        --     ft = {"php"}
        --
        -- }
        {
            "gbprod/phpactor.nvim",
            -- run = require("phpactor.handler.update"), -- To install/update phpactor when installing this plugin
            requires = {
                "nvim-lua/plenary.nvim", -- required to update phpactor
                "neovim/nvim-lspconfig" -- required to automaticly register lsp serveur
            },
            config = function()
                require("phpactor").setup({
                    install = {
                        -- path = vim.fn.stdpath("data") .. "/opt/",
                        branch = "master",
                        bin = vim.fn.stdpath("data") .. "/lsp_servers/phpactor/bin/phpactor",
                        php_bin = "php",
                        composer_bin = "composer",
                        git_bin = "git",
                        check_on_startup = "none",
                    },
                    lspconfig = {
                        enabled = true,
                        options = {},
                    },
                })
            end
        },
    })
end

return M
