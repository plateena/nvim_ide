local set = vim.opt

vim.o.colorcolumn = '80'


set.autoindent = true
set.smartindent = true
set.wildmode="longest:full"

vim.o.cursorline = true     -- Highlight the current cursor line (Can slow the UI)
vim.o.encoding = "utf-8"    -- Just in case
vim.o.expandtab = true      -- Use appropriate number of spaces (no so good for PHP but we can fix this in ft)
vim.o.hidden = true         -- Allow multple buffers
vim.o.history = 5000
vim.o.hlsearch = true       -- Highlight search results
vim.o.ignorecase = true     -- Search ignoring case
vim.o.incsearch = true
vim.o.mouse="i"             -- Enable mouse on insert mode
vim.o.number = true         -- Show numbers on the left
vim.o.relativenumber = true -- Its better if you use motions like 10j or 5yk
vim.o.shiftwidth = 0        -- Number of spaces to use for each step of (auto)indent
vim.o.showmatch  = true     -- Highlights the matching parenthesis
vim.o.showmode = false      -- Remove the -- INSERT -- message at the bottom
vim.o.signcolumn = "yes"    -- Always show the signcolumn, otherwise it would shift the text
vim.o.smartcase = true      -- Do not ignore case if the search patter has uppercase
vim.o.softtabstop = 4       -- On insert use 4 spaces for tab
vim.o.swapfile = false      -- Do not leave any backup files
vim.o.tabstop = 4           -- Tab size of 4 spaces
vim.o.termguicolors = true  -- Required for some themes
vim.o.updatetime = 750      -- I have a modern machine. No need to wait that long
vim.opt.list = true
vim.opt.listchars:append "eol:↴"
-- vim.o.splitright = true     -- New vert splits are on the right
-- vim.o.splitbelow = true     -- New horizontal splits, like `:help`, are on the bottom window
-- vim.o.cmdheight=2           -- Shows better messages
-- vim.o.wrap = false          -- Wrapping sucks (except on markdown)
