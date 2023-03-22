require "zack.globals.keymaps"
require "zack.globals.options"
require "filetype"
require "plugin"

vim.cmd([[ 
hi NonText guibg=none  ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE
au ColorScheme * hi Normal ctermbg=none guibg=none
]])
