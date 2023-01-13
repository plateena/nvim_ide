require('telescope').setup({
    defaults = {
        layout_config = {
            vertical = { width = 1 }
            -- other layout configuration here
        },
        -- other defaults configuration here
    },
    pickers = {
        find_files = {
            sort_lastused = true,
        },
        buffers = {
            sort_lastused = true,
        }
    }
    -- other configuration values here
})

local map = vim.api.nvim_set_keymap
map('n', '<C-n>', ':Telescope buffers<CR>', {})
map('n', '<C-f>', ':Telescope find_files<CR>', {})
map('n', '<C-g>', ':Telescope git_files<CR>', {})
map('n', '<C-h>', ':Telescope oldfiles<CR>', {})
map('n', '<C-t>c', ':Telescope command_history<CR>', {})
map('n', '<C-t>g', ':Telescope git_status<CR>', {})
map('n', '<C-t>m', ':Telescope marks<CR>', {})
map('n', '<C-t>k', ':Telescope keymaps<CR>', {})
map('n', '<C-t>r', ':Telescope keymaps<CR>', {})
map('n', '<C-t>f', ':Telescope current_buffer_fuzzy_find<CR>', {})
map('n', '<C-t>t', ':Telescope tags<CR>', {})

-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
