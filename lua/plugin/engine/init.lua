local function plugins(use)
    use({
        'nvim-treesitter/nvim-treesitter', 
        -- cmp plugin
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
    })
end

return { plugins = plugins }
