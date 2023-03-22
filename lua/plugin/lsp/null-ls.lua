local M = {}

M.plugins = function(use)
    use({
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/null-ls.nvim",
    })
end

M.setup = function()
    local null_ls_status_ok, null_ls = pcall(require, "null-ls")

    if not null_ls_status_ok then
        return
    end

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    local path = vim.api.nvim_exec("pwd",  true)
    null_ls.setup({
        debug = false,
        sources = {
            formatting.prettier.with({
                extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } ,
                disabled_filetype = { "lua" },
            }),
            -- formatting.black.with({ extra_args = { "--fast" } }),
            formatting.stylua,
            -- diagnostics.flake8
            diagnostics.phpcs.with({
                extra_args = {
                    "--standard=" .. path .. "/phpcs.xml",
                }
            }),
        },
    })
end

return M
