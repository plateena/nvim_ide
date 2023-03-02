require("utils")

local opts = { noremap=true, silent=false }

if isModuleAvailable('Comment') then
    require('Comment').setup()
end

require('trouble').setup{}
require('todo-comments').setup{}
require('nvim-treesitter.configs').setup{
    ensure_installed = {
        "lua", "vim", "scss", "css", "php", "javascript", "typescript",
        "markdown", "markdown_inline", "regex", "bash"
    },
    context_commentstring = {
        enable = true,
        commentary_integration = {
            -- change default mapping
            Commentary = 'g/',
            -- disable default mapping
            CommentaryLine = false,
        },
    }
}

require("mason").setup{};
require("mason-lspconfig").setup()
require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
require('lspconfig').pyright.setup{}
require('lspconfig').phpactor.setup{
    on_attach = on_attach,
    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
    }
}



-- require "plugin.lualine"
require "plugin.lspconfig"
require "plugin.nvim-cmp"
require "plugin.nvim-tree"
-- require "plugin.telescope"


vim.cmd("let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
