local lsp = require("lua.zack.utils.lsp-func")
local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        formatting.stylua,
        diagnostics.luacheck,
    },
})

