local basePath = "plugin.lsp."
local M  = {}

local modules = {
    "nvim-lspconfig"
}


local plugs = {
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local servers = {
                "phpactor",
                "pyright",
            }
            require("mason-lspconfig").setup({
                ensure_installed = servers,
                automatic_installation = false,
            })
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
                ui = {
                    icons = {
                        server_installed = "✓",
                        server_pending = "➜",
                        server_uninstalled = "✗"
                    }
                }
            })
        end
    },
    "hrsh7th/cmp-nvim-lsp",
    -- "williamboman/nvim-lsp-installer",
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
