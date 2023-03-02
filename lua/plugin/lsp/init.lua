local M = {}

M.plugins = function(use)
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'williamboman/nvim-lsp-installer',
        'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    })

end

return M
