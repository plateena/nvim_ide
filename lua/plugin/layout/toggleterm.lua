local M = {}

M.plugins = function(use)
    use({
        "akinsho/toggleterm.nvim",
        tag = "*",
    })
end

M.setup = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({})

    function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>]], opts)
        vim.keymap.set('t', '<C-t>', [[<C-\><C-n>:ToggleTerm<Cr>]], opts)
    end

    vim.keymap.set('n', '<C-t>', ":ToggleTerm<CR>", {})

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end

return M
