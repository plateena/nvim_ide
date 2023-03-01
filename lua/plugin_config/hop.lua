require('hop').setup{ keys = 'etovxqpdygfblzhckisuran' }

-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection

map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local expr = { noremap = true, silent = true, expr = true }

-- map("n", "<Leader>ff", ":HopChar1<Cr>", opts)

-- vim.keymap.set('', 'ff', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
-- end, {remap=true})
-- vim.keymap.set('', 'f2', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
-- end, {remap=true})
-- vim.keymap.set('', 'fw', function()
--   hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
-- end, {remap=true})
