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
        { "catppuccin/nvim", as = "catppuccin" },
        'loctvl842/monokai-pro.nvim',
        "navarasu/onedark.nvim",
        "NLKNguyen/papercolor-theme",
        'arcticicestudio/nord-vim',
        { "bluz71/vim-nightfly-colors", as = "nightfly" }
    })
end

local function runs() 
    vim.cmd "colorscheme default"

    local colorscheme = "ayu-mirage"

    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

    if not status_ok then
        vim.notify("colorscheme " .. colorscheme .. " not found!")
    end

    vim.api.nvim_command("hi LineNr guifg=#377982 ctermfg=33")
end

return { plugins = plugins, runs = runs }
