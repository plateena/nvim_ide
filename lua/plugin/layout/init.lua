local basePath = "plugin.layout."
local M  = {}

local modules = {
    'telescope',
    'lualine',
    'nvim-tree',
}

local plugs = {
    -- {
    --     "folke/noice.nvim", as = 'noice', requires = {
    --         "MunifTanjim/nui.nvim",
    --         "rcarriga/nvim-notify",
    --     }
    -- },
    'majutsushi/tagbar' ,                        -- code structure
    "voldikss/vim-floaterm",
}

M.plugins = function(use)
    setupPlugins(use, plugs, modules, basePath)
end

return M

