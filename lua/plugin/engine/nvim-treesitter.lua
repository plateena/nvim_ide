local M = {}

M.plugins = function(use)
	use({ "nvim-treesitter/nvim-treesitter" })
end

M.setup = function()
	local lang =
		{
			"bash",
			"css",
			"fish",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"php",
			"python",
			"regex",
			"scss",
			"tsx",
			"typescript",
			"vim",
			"yaml",
		}

	require("nvim-treesitter.configs").setup({
	-- change default mapping
	-- disable default mapping
		ensure_installed = lang,
		highlight = {
			enable = true,
			disable = {},
		},
		autopairs = { enable = true },
		indent = {
			enable = true,
			disable = {},
		},
		context_commentstring = {
			enable = true,
			commentary_integration = {
				Commentary = "g/",
				CommentaryLine = false,
			},
		},
	})

	local vim = vim
	local opt = vim.opt

	opt.foldmethod = "expr"
	opt.foldexpr = "nvim_treesitter#foldexpr()"
	vim.api.nvim_create_autocmd(
		{ "BufEnter" },
		{
			pattern = { "*" },
			command = "normal zx",
		}
	)
end

return M
