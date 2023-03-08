local basePath = "plugin.engine."

local M  = {}

local modules = {
    'nvim-treesitter',
    'nvim-cmp',
}

local plugs = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    "folke/which-key.nvim",
    {
        'vim-test/vim-test',
        config = function ()
        end
    }
}

M.plugins = function(use)
    setupPlugins(use, plugs, modules, basePath)
end

M.runs = function()
    require("plugin.engine.which-key")
end

return M
