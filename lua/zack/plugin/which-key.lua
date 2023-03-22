local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 40, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true,   -- bindings for folds, spelling and others prefixed with z
            g = true,   -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 6, max = 25 },                                        -- min and max height of the columns
        width = { min = 25, max = 50 },                                        -- min and max width of the columns
        spacing = 2,                                                           -- spacing between columns
        align = "left",                                                        -- align columns left, center or right
    },
    ignore_missing = false,                                                    -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true,                                                          -- show help message on the command line when the popup is visible
    triggers = "auto",                                                         -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_nowait = {
        -- marks
        "`",
        "'",
        "g`",
        "g'",
        -- registers
        '"',
        "<c-r>",
        -- spelling
        "z=",
    },
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
    mode = "n",  -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    ["n"] = {
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Buffers",
    },
    ["q"] = { "<cmd>q!<CR>", "Quit" },
    ["<Cr>"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["c"] = { "<cmd>Telescope command_history<CR>", "Command history" },
    --    f = {
    --        name = "Files",
    --        f = {
    --            "<cmd>lua require('telescope.builtin').fd(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    --            "Find files",
    --        },
    --        g = { "<cmd>Telescope git_status<cr>", "Files in git status" },
    --        F = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
    --        w = { "<cmd>w!<cr>", "Write file" },
    --        W = { "<cmd>SudaWrite<cr>", "Suda write file" },
    --        h = {
    --            "<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    --            "Oldfiles",
    --        },
    --        P = { "<cmd>Prettier<cr>", "Prettier" },
    --        d = { "<Cmd>bd<Cr>", "Close buffer"}
    --    },
    --
    e = {
        name = "Explorer",
        t = { "<cmd>NvimTreeToggle<cr>", "Tree Toggle" },
        f = { "<cmd>NvimTreeFindFileToggle<cr>", "Find file Toggle" },
        b = { "<cmd>TagbarToggle<cr>", "Tagbar toggle" },
    },
    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    g = {
        name = "Git",
        g = { "<cmd>FloatermNew --disposable --cmd='lazygit'<cr>", "Lazygit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        -- S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        S = { "<cmd>Telescope git_status<Cr>", "Stage Hunk" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = {
            "<cmd>Gitsigns diffthis HEAD<cr>",
            "Diff",
        },
        -- fugutive
        s = { "<cmd>Git<cr>", "Git fugutive" },
        t = {
            name = "Telescope git",
            f = { "<cmd>Telescope git_files<cr>", "Telescope git files" },
            s = { "<cmd>Telescope git_status<Cr>", "Telescope git status (List all changes files)" },
        },
    },
    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = {
            "<cmd>Telescope diagnostics bufnr=0<cr>",
            "Document Diagnostics",
        },
        w = {
            "<cmd>Telescope diagnostics<cr>",
            "Workspace Diagnostics",
        },
        -- f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        j = {
            "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
            "Next Diagnostic",
        },
        k = {
            "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
            "Prev Diagnostic",
        },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols",
        },
    },
    s = {
        name = "Search",
        -- R = { "<cmd>Telescope registers<cr>", "Registers" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        r = { "<cmd>Telescope resume<cr>", "Resume search" },
    },
    -- t = {
    --     name = "Terminal",
    --     t = { "<Cmd>ToggleTerm<Cr>", ""}
    -- n = { "<cmd>FloatermNew --wintype=split<cr>", "New Terminal" },
    -- h = { "<cmd>FloatermHide<cr>", "Hide Terminal" },
    -- t = { "<cmd>FloatermToggle<cr>", "Toggle Terminal" },
    -- k = { "<cmd>FloatermKill<cr>", "Kill Terminal" },
    -- },

    v = {
        name = "Vsnip",
        o = { "<cmd>VsnipOpenEdit<cr>", "Vsnip open edit" },
    },
    o = {
        name = "Options",
        f = {
            name = "Foldmethod",
            a = { "<Cmd>setlocal foldmethod='manual'<Cr>", "Set foldmethod manual" },
            e = { "<Cmd>setlocal foldmethod='expr'<Cr>", "Set foldmethod expr" },
            i = { "<Cmd>setlocal foldmethod='indent'<Cr>", "Set foldmethod indent" },
            m = { "<Cmd>setlocal foldmethod='marker'<Cr>", "Set foldmethod marker" },
            s = { "<Cmd>setlocal foldmethod='syntax'<Cr>", "Set foldmethod syntax" },
            d = { "<Cmd>setlocal foldmethod='diff'<Cr>", "Set foldmethod diff" },
        },
        y = {
            name = "Yank",
            i = { "<Cmd>setlocal paste<Cr>", "Set paste true" },
            o = { "<Cmd>setlocal nopaste<Cr>", "Set paste false" },
        },
        i = {
            name = "Yank",
            i = { "<Cmd>setlocal autoindent smartindent<Cr>", "Set autoindent and smartindent true" },
            o = { "<Cmd>setlocal noautoindent nosmartindent<Cr>", "Set autoindent and smartindent false" },
        },
        t = {
            name = "Tab",
            w = { "<Cmd>setlocal tabstop=2<Cr>", "Set tabstop 2" },
            r = { "<Cmd>setlocal tabstop=4<Cr>", "Set tabstop 4" },
        },
        s = {
            name = "Spell",
            q = { "<Cmd>setlocal spell<Cr>", "Set spell" },
            n = { "<Cmd>setlocal nospell<Cr>", "Set nospell" },
        },
        c = {
            name = "Conceal",
            q = { "<Cmd>setlocal conceallevel=0<Cr>", "Set conceallevel 0" },
            w = { "<Cmd>setlocal conceallevel=1<Cr>", "Set conceallevel 1" },
            e = { "<Cmd>setlocal conceallevel=2<Cr>", "Set conceallevel 2" },
            r = { "<Cmd>setlocal conceallevel=3<Cr>", "Set conceallevel 3" },
            a = { '<Cmd>setlocal concealcursor=""<Cr>', "Set concealcursor to null" },
        },
    },
}

which_key.setup(setup)
which_key.register(mappings, opts)
