local basePath = "plugin.lsp."
local M = {}

local modules  = {
    "nvim-lspconfig",
    "null-ls",
}


local plugs = {
    {
        "williamboman/nvim-lsp-installer",
        disbale = true,
        config = function()
            require("nvim-lsp-installer").setup({
                ensure_installed = { "phpactor" },
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
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local servers = {
                -- "jsonls",
                -- "lua_ls",
                -- "phpactor",
                -- "pyright",
                -- "tsserver",
                -- "yamlls",
            }
            require("mason-lspconfig").setup({
                ensure_installed = servers,
                automatic_installation = true,
            })
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                automatic_installation = false, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
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
}

M.plugins = function(use)
    setupPlugins(use, plugs, modules, basePath)
end

M.runs = function()
end

return M
