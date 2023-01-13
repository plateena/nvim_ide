vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.blade.php",
  command = "set filetype=html"
})
