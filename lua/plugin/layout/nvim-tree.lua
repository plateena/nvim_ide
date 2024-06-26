local M = {}

M.plugins = function(use) 
    use({
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
    })
end

M.setup = function() 
    local status_ok, nvim_tree = pcall(require, "nvim-tree")
    if not status_ok then
        return
    end

    local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
    if not config_status_ok then
        return
    end

    local tree_cb = nvim_tree_config.nvim_tree_callback

    nvim_tree.setup {
        sort_by = "name",
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
        renderer = {
            root_folder_modifier = ":t",
            icons = {
                glyphs = {
                    -- default = "",
                    -- symlink = "",
                    folder = {
                        arrow_open = "",
                        arrow_closed = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                    git = {
                        unstaged = "",
                        staged = "S",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "U",
                        deleted = "",
                        ignored = "◌",
                    },
                },
            },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        view = {
            width = 40,
            side = "left",
            number = true,
            relativenumber = true,
            signcolumn = "yes",
            mappings = {
                list = {
                    -- { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                    -- { key = "h", cb = tree_cb "close_node" },
                    -- { key = "v", cb = tree_cb "vsplit" },
                },
            },
        },
        filters = {
            dotfiles = false,
            git_clean = false,
            no_buffer = false,
            custom = {},
            exclude = {},
        },
    }
end

return M
