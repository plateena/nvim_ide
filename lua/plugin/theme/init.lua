local function plugins(use)
    use({
        "EdenEast/nightfox.nvim",
        "ellisonleao/gruvbox.nvim" ,
        "savq/melange",
        'Mofiqul/dracula.nvim',
        'NTBBloodbath/doom-one.nvim',
        'Shatur/neovim-ayu',
        'bluz71/vim-moonfly-colors',
        'bluz71/vim-nightfly-guicolors',
        { 'folke/tokyonight.nvim', disable = false , bufread = false },
        'patstockwell/vim-monokai-tasty',
        'rmehri01/onenord.nvim',
        { 'lalitmee/cobalt2.nvim', requires = 'tjdevries/colorbuddy.nvim' },
        { 'luisiacc/gruvbox-baby', branch = 'main'},
    })
end

local function runs() 
    vim.cmd "colorscheme default"

    local colorscheme = "ayu-mirage"

    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

    if not status_ok then
        vim.notify("colorscheme " .. colorscheme .. " not found!")
    end
end

return { plugins = plugins, runs = runs }
