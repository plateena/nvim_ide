local opts = { noremap=true, silent=false }

require("utils.check-module")

vim.keymap.set('n', '\\gs', ':Git<CR>', opts)

require('nvim-tree').setup{}

require('lualine').setup {
    options = {
        theme = 'dracula-nvim'
    }
}

if isModuleAvailable('nvim-autopairs') then
    require('nvim-autopairs').setup{}
end

if isModuleAvailable('Comment') then
    require('Comment').setup()
end

if isModuleAvailable('hop') then
    require 'plugin_config.hop'
end

-- if isModuleAvailable('vsnip') then
-- require 'plugin_config.vsnip'
-- end

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

require("noice").setup({
    cmdline = { 
        enabled = true,
        view = "cmdline"
    },
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        }
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
    }
})

require("typescript").setup({})

require "plugin_config.lualine"
require "plugin_config.lspconfig"
require "plugin_config.nvim-cmp"
require "plugin_config.nvim-tree"
require "plugin_config.telescope"


vim.cmd("let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
