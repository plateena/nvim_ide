local M = {}

local modules = {}

local plugs = {
    'vimwiki/vimwiki', 
    'plateena/taskwiki',
}

M.plugins = function(use)
    setupPlugins(use, plugs, modules, basePath)
end

return M
