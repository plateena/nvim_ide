local basePath = "plugin.layout."
local M = {}

local modules = { "telescope", "lualine", "toggleterm", "nvim-tree" }

local plugs = { -- {
--     "folke/noice.nvim", as = 'noice', requires = {
--         "MunifTanjim/nui.nvim",
--         "rcarriga/nvim-notify",
--     }
-- },
"majutsushi/tagbar", -- "voldikss/vim-floaterm", -- code structure
{
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({})
	end,
}, "NvChad/nvim-colorizer.lua", "nvim-tree/nvim-web-devicons", "DanilaMihailov/beacon.nvim", { -- cursor jump
	"Yggdroot/indentLine", -- see indentation
	disable = true,
	run = function()
		print"indentLine"
		vim.o.indentLine.setConceal = 0
		vim.o.concealcursor = ""
		-- vim.opt.indentLine.setConceal=0
		-- vim.opt.indentLine.setConceal=0
	end,
}, {
	"thaerkh/vim-indentguides",
	diable = true,
}, {
	"anuvyklack/pretty-fold.nvim",
	config = function()
		require("pretty-fold").setup()
	end,
}, "tpope/vim-dispatch", {
	"nyngwang/NeoZoom.lua",
	config = function()
		require("neo-zoom").setup{
			winopts = {
				offset = {
					-- : you can omit `top` and/or `left` to center the floating window.
					-- top = 0,
					-- left = 0.17,
					width = 180,
					height = 80,
				},
				-- : check :help nvim_open_win() for possible border values.
				border = "rounded",
			},
			-- exclude_filetypes = { 'lspinfo', 'mason', 'lazy', 'fzf', 'qf' },
			exclude_buftypes = {},
			presets = { {
				filetypes = { "dapui_.*", "dap-repl" },
				config = {
					top = 0.25,
					left = 0.6,
					width = 180,
					height = 50,
				},
				callbacks = { function()
					vim.wo.wrap = true
				end },
			} },
			-- popup = {
			--   -- : Add popup-effect (replace the window on-zoom with a `[No Name]`).
			--   -- This way you won't see two windows of the same buffer
			--   -- got updated at the same time.
			--   enabled = true,
			--   exclude_filetypes = {},
			--   exclude_buftypes = {},
			-- },
		}
		vim.keymap.set(
			"n",
			"<C-z>",
			function()
				vim.cmd("NeoZoomToggle")
			end,
			{
				silent = true,
				nowait = true,
			}
		)
	end,
} }

M.plugins = function(use)
	setupPlugins(use, plugs, modules, basePath)
end

return M
