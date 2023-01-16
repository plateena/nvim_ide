require("nvim-tree").setup {
    sort_by = "name",
    view = {
        number = true,
        relativenumber = true,
        signcolumn = "yes",
    },
    filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = {},
        exclude = {},
    },
}
