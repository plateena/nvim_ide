local basePath = "plugin.lsp."
local M  = {}

local modules = {
    "nvim-lspconfig"
}

local plugs = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/nvim-lsp-installer",
}

M.plugins = function(use)
    setupPlugins(use, plugs, modules, basePath)
end

M.runs = function()
    -- require("plugin.lsp.mason")
    -- require("plugin.lsp.handlers").setup()
    -- require("plugin.lsp.null-ls")
end

return M
