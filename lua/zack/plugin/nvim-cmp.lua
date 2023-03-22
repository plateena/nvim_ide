-- Set up nvim-cmp.
local cmp = require'cmp'

--   פּ ﯟ   some other good icons
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

local lspkind = require('lspkind')

-- find more here: https://www.nerdfonts.com/cheat-sheet
local function border(hl_name)
    --[[ { "┏", "━", "┓", "┃", "┛","━", "┗", "┃" }, ]]
    --[[ {"─", "│", "─", "│", "┌", "┐", "┘", "└"}, ]]
    return {
        { "┌", hl_name },
        { "─", hl_name },
        { "┐", hl_name },
        { "│", hl_name },
        { "┘", hl_name },
        { "─", hl_name },
        { "└", hl_name },
        { "│", hl_name },
    }
end

cmp.setup({
    window = {
        completion = {
            border = border "FloatBorder",
            winhighlight = "Normal:NormalFloat,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
            border = border "FloatBorder",
        },
    },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    formatting = {
    format = function(entry, vim_item)
        if vim.tbl_contains({ 'path' }, entry.source.name) then
            local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
            if icon then
                vim_item.kind = icon
                vim_item.kind_hl_group = hl_group
                return vim_item
            end
        end
        return require('lspkind').cmp_format({ with_text = true })(entry, vim_item)
    end
},
sources = cmp.config.sources({
    { name = 'vsnip' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    -- { name = 'treesitter' },
    { name = 'tags' },
    { name = 'rg' },
}, {
    { name = 'buffer' },
}),
experimental = ({
    ghost_text = true,
    native_menu = false,
}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})
