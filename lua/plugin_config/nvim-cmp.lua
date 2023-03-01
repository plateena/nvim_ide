-- vim.api.nvim_exec([[
-- " autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
-- " autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
-- " autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
-- " autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
-- " autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
-- " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
-- " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
-- " autocmd FileType php set omnifunc=phpcomplete#CompletePHP
-- " autocmd BufRead,BufNewFile *.md setlocal spell
-- ]], true)

-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require'cmp'
--local lspkind = require'lspkind'

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

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
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
        ["<C-e>"] = cmp.mapping.abort(),
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
        --    format = lspkind.cmp_format({
        --      mode = 'symbol_text',
        --      maxwidth = 50,
        --
        --      before = function (entry, vim_item)
        --        return vim_item
        --      end
        --    })
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'calc' },
        { name = 'treesitter' },
        { name = 'tags' },
        { name = 'rg' },
    }, {
        { name = 'buffer' },
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

-- cmp.event:on(
--   'confirm_done',
--   cmp_autopairs.on_confirm_done()
-- )


map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local expr = { noremap = true, silent = true, expr = true }

