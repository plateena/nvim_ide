local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local M = {}

M.plugins = function(use) 
    use({
        'hrsh7th/nvim-cmp',
    })
end

M.setup = function() 
    local cmp = require('cmp')

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
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<A-l>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ["<CR>"] = cmp.mapping.confirm({select = true}),
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif vim.fn['vsnip#available'](1) == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)","")
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif vim.fn['vsnip#jumpable'](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)","")
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),

        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                -- Kind icons
                vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snippet]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                })[entry.source.name]
                return vim_item
            end,
        },

        sources = cmp.config.sources({
            { name = 'vsnip' },
            { name = 'nvim_lsp' },
            { name = 'path' },
            { name = 'calc' },
            { name = 'treesitter' },
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

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({'/', '?'}, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({{ name = 'path' }},
            {{ name = 'cmdline' }})
    })
end

return M
