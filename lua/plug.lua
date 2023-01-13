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

    -- My plugins here
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Colorscheme
    use 'bluz71/vim-nightfly-guicolors'
    use { "ellisonleao/gruvbox.nvim" }
    use 'bluz71/vim-moonfly-colors'
    use 'patstockwell/vim-monokai-tasty'
    use "savq/melange"
    use 'folke/tokyonight.nvim'
    use "EdenEast/nightfox.nvim"
    use { 'lalitmee/cobalt2.nvim', requires = 'tjdevries/colorbuddy.nvim' }
    use 'rmehri01/onenord.nvim'
    use 'Shatur/neovim-ayu'
    use { 'luisiacc/gruvbox-baby', branch = 'main'}
    use { 'NTBBloodbath/doom-one.nvim'}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
