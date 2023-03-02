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
}

M.plugins = function(use)
    setupPlugins(use, plugs, modules, basePath)
end

return M
