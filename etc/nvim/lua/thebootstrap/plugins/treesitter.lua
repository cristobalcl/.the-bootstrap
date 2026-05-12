-- nvim-treesitter (main branch) uses vim.treesitter built-in APIs
-- ensure_installed is now handled via the nvim-treesitter module
require'nvim-treesitter'.setup {
  ensure_installed = { "python", "javascript", "typescript", "lua", "vim", "vimdoc", "query", "comment" },
  auto_install = true,
}

-- Highlighting is enabled by default via vim.treesitter in Neovim 0.12+
-- Disable for large files
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
    if ok and stats and stats.size > max_filesize then
      vim.treesitter.stop(args.buf)
    end
  end,
})
