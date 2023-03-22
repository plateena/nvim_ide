local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

local theme = require("zack.color-plugin")
local plug = {
    -- Theme
    theme,
    -- Layout
    "nvim-lualine/lualine.nvim",

    "nvim-lua/plenary.nvim", -- require by telescope
    { "nvim-telescope/telescope.nvim", tag = "0.1.1" },

    -- autocomplete
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "hrsh7th/vim-vsnip",
    "onsails/lspkind.nvim",

    'nvim-tree/nvim-tree.lua',
    "nvim-tree/nvim-web-devicons",

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    "jose-elias-alvarez/null-ls.nvim",

    "folke/which-key.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context",

    'numToStr/Comment.nvim',
}

-- Install your plugins here
packer.startup(function(use)
    use(plug)
end)
