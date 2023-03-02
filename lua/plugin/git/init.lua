local M  = {}

local plug = {
    { 'tpope/vim-fugitive', as = 'vim-fugitive' },
    {'lewis6991/gitsigns.nvim', as = 'gitsigns'},
    {'jesseduffield/lazygit' },
}

M.plugins = function(use)
    for k, v in pairs(plug) do
        use(v)
    end
end

M.runs = function() 
    if isHasValueInTable(plug, 'gitsigns') then
        require("plugin.git.gitsigns")
    end
end

return M
