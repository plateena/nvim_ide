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
    {
        "folke/trouble.nvim",
        config = function()
            require('trouble').setup({})
        end
    },
    'NvChad/nvim-colorizer.lua',
    'nvim-tree/nvim-web-devicons',
    'DanilaMihailov/beacon.nvim',                -- cursor jump
    'Yggdroot/indentLine',                       -- see indentation
}

M.plugins = function(use)
    setupPlugins(use, plugs, modules, basePath)
end

return M

