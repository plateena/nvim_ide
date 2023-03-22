local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
            },
        },
    },
})

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fF", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fc", builtin.command_history, {})
vim.keymap.set("n", "<leader>fs", builtin.search_history, {})
vim.keymap.set("n", "<leader>fm", builtin.marks, {})
vim.keymap.set("n", "<leader>fq", builtin.quickfix, {})
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
vim.keymap.set("n", "<leader>fr", builtin.resume, {})

vim.keymap.set("n", "<leader>gF", builtin.grep_string, {})
