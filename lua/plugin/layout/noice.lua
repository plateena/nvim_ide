require("noice").setup({
    cmdline = {
        enabled = false,
        view = "cmdline"
    },
    views = {
        cmdline_popup = {
            position = {
                row = 10,
                col = '50%',
            },
            size = {
                width = 90,
                height = 'auto',
            }
        },
        popupmenu = {
            relative = "editor",
            position = {
                position = {
                    row = 1,
                    col = '50%',
                },
                size = {
                    width = 90,
                    height = 'auto',
                },
                border = {
                    style = "rounded",
                    padding = {0,1},
                },
                win_options = {
                    winhighlight = {
                        Normal = "Normal",
                        FloatBorder = "DiagnosticInfo",
                    }
                },
            },
        },
    }
    -- cmdline = { 
    --     enabled = true,
    --     view = "cmdline"
    -- },
    -- lsp = {
    --     override = {
    --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --         ["vim.lsp.util.stylize_markdown"] = true,
    --         ["cmp.entry.get_documentation"] = true,
    --     }
    -- },
    -- presets = {
    --     bottom_search = true,
    --     command_palette = true,
    --     long_message_to_split = true,
    --     inc_rename = false,
    --     lsp_doc_border = false,
    -- }
})
