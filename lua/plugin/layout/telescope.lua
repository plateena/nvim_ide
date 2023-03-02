local M = {}

M.plugins = function(use)
    use({ 
        { 'nvim-telescope/telescope.nvim', as = 'telescope', tag = '0.1.0', requires = { 'nvim-lua/plenary.nvim' } },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        "kelly-lin/telescope-ag",
    })
end

M.setup = function ()
    local telescope = require("telescope")
    -- require("telescope").load_extension("noice")

    local telescope = require("telescope").load_extension("fzf")
    local telescopeConfig = require("telescope.config")
    local previewers = require("telescope.previewers")
    local Job = require("plenary.job")

    local new_maker = function(filepath, bufnr, opts)
        filepath = vim.fn.expand(filepath)
        Job:new({
            command = "file",
            args = { "--mime-type", "-b", filepath },
            on_exit = function(j)
                local mime_type = vim.split(j:result()[1], "/")[1]
                if mime_type == "text" then
                    previewers.buffer_previewer_maker(filepath, bufnr, opts)
                else
                    -- maybe we want to write something to the buffer here
                    vim.schedule(function()
                        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
                    end)
                end
            end
        }):sync()
    end

    -- Clone the default Telescope configuration
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- I want to search in hidden/dot files.
    table.insert(vimgrep_arguments, "--hidden")
    -- I don't want to search in the `.git` directory.
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")
    -- You don't need to set any of these options.
    -- IMPORTANT!: this is only a showcase of how you can set default options!
    require("telescope").setup {
        defaults = {
            -- don't preview binary
            buffer_previewer_maker = new_maker,
            -- `hidden = true` is not supported in text grep commands.
            vimgrep_arguments = vimgrep_arguments,
            layout_config = {
                vertical = { width = 1 }
                -- other layout configuration here
            },
            -- other defaults configuration here
        },
        pickers = {
            find_files = {
                find_command = {
                    "fd",
                    "--hidden",
                    "--exclude",
                    ".git",
                    "--exclude",
                    "node_modules",
                    "--no-ignore",
                    "--ignore-file",
                    ".teleignore",
                    "--strip-cwd-prefix"
                },
                sort_lastused = true,
            },
            buffers = {
                sort_lastused = true,
            }
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
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
    -- require("telescope").load_extension "file_browser"
end

return M

-- local map = vim.api.nvim_set_keymap
-- map('n', '<C-n>', ':Telescope buffers<CR>', {})
-- map('n', '<C-f>', ':Telescope find_files<CR>', {})
-- map('n', '<C-g>', ':Telescope git_files<CR>', {})
-- map('n', '<C-h>', ':Telescope oldfiles<CR>', {})
-- map('n', '<C-t>c', ':Telescope command_history<CR>', {})
-- map('n', '<C-t>g', ':Telescope git_status<CR>', {})
-- map('n', '<C-t>m', ':Telescope marks<CR>', {})
-- map('n', '<C-t>k', ':Telescope keymaps<CR>', {})
-- map('n', '<C-t>r', ':Telescope keymaps<CR>', {})
-- map('n', '<C-t>f', ':Telescope current_buffer_fuzzy_find<CR>', {})
-- map('n', '<C-t>t', ':Telescope tags<CR>', {})
--
--
