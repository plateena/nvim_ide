local basePath = "plugin.engine."
local M  = {}

local modules = {
    'nvim-treesitter',
}

local plugs = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
}

M.plugins = function(use)
    setupPlugins(use, plugs, modules, basePath)
end

return M
