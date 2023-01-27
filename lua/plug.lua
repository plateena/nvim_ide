
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Colorscheme
    use {
        "EdenEast/nightfox.nvim",
        "ellisonleao/gruvbox.nvim" ,
        "savq/melange",
        'Mofiqul/dracula.nvim',
        'NTBBloodbath/doom-one.nvim',
        'Shatur/neovim-ayu',
        'bluz71/vim-moonfly-colors',
        'bluz71/vim-nightfly-guicolors',
        'folke/tokyonight.nvim',
        'patstockwell/vim-monokai-tasty',
        'rmehri01/onenord.nvim',
        { 'lalitmee/cobalt2.nvim', requires = 'tjdevries/colorbuddy.nvim' },
        { 'luisiacc/gruvbox-baby', branch = 'main'},
    }

    -- My plugins here

    -- Tools
    use {
        'tpope/vim-fugitive',                        -- git integration
        'majutsushi/tagbar',                         -- code structure
        { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } },
        { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { 'nvim-lua/plenary.nvim' } },
        "kelly-lin/telescope-ag",
    }

    -- Vimwiki
    use {
        'vimwiki/vimwiki', 
    }

    use 'plateena/taskwiki'

    -- PHP
    use 'noahfrederick/vim-laravel'
    use { 'phpactor/phpactor', tag = '*', run = 'composer install --no-dev -o'}
    use {
        'praem90/nvim-phpcsf',
        config = function()
            require("phpcs").cs()
            require("phpcs").cbf()
        end
    }

    -- Editor 
    use {
        "folke/todo-comments.nvim",
        "machakann/vim-sandwich",
        "mattn/emmet-vim",
        "rafamadriz/friendly-snippets",
        'JoosepAlviste/nvim-ts-context-commentstring'
        'numToStr/Comment.nvim',
        'nvim-treesitter/nvim-treesitter',
        'tpope/vim-commentary',
        -- 'tpope/vim-commentary',
        { 'phaazon/hop.nvim', branch = 'v2' }, 
    }

    use {
        'prettier/vim-prettier', 
        run = 'npm install --frozen-lockfile --production'
    }

    -- Linter
    use {
        'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
        'williamboman/nvim-lsp-installer', 
        "folke/trouble.nvim",
    }

    -- Completion
    use {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',

        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
    }


    -- Theme
    use {
        'NvChad/nvim-colorizer.lua',
        'nvim-tree/nvim-web-devicons',
        'DanilaMihailov/beacon.nvim',                -- cursor jump
        'Yggdroot/indentLine',                       -- see indentation
        'nvim-lualine/lualine.nvim',                     -- statusline
    }

    -- Less important
    use { 'windwp/nvim-autopairs' , cond = false }                    -- auto close brackets, etc.
    use {
        "nvim-telescope/telescope-file-browser.nvim", -- filesystem navigation
        'junegunn/gv.vim',                          -- commit history
        { 'weilbith/nvim-code-action-menu', cmd = { 'CodeActionMenu'} }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
