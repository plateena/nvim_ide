require("utils")

local fn = vim.fn

local ensure_packer = function()
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local function get_plugins(use) 
    local modules = {
        "doc",
        "theme",
        "editor",
        "engine",
        "language",
        "git",
        "layout",
        "lsp",
    }

    for _, mode in pairs(modules) do
        if require("plugin." .. mode).plugins ~= nil then
            require("plugin." .. mode).plugins(use)
        end

        if require("plugin." .. mode).runs ~= nil then
            require("plugin." .. mode).runs()
        end

    end

end

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

packer.startup(function(use)
    get_plugins(use)

    use 'wbthomason/packer.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

vim.cmd("let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
