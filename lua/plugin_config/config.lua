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

require('trouble').setup{}
require('todo-comments').setup{}
require('nvim-treesitter.configs').setup{
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

require('lspconfig').pyright.setup{}
require('lspconfig').phpactor.setup{
    on_attach = on_attach,
    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
    }
}

require "plugin_config.telescope"
require "plugin_config.lualine"
require "plugin_config.nvim-cmp"
require "plugin_config.nvim-tree"

vim.cmd("let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
