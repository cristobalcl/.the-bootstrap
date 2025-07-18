vim.api.nvim_create_autocmd({"FileType"}, {
  -- pattern = "terraform",
  -- pattern = {"*.tf", "*.tfvars"},
  pattern = {"terraform", "tf", "hcl", "*.tf", "*.tfvars"},
  -- group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
  callback = function(ev)
    vim.bo[ev.buf].commentstring = "# %s"
  end,
})

-- -- vim.api.nvim_create_autocmd({"FileType"}, {
-- --   pattern = { "markdown" },
-- --   callback = function(ev)
-- --     vim.bo[ev.buf].conceallevel = 0
-- --   end,
-- -- })

-- vim.cmd [[
--   augroup markdown_conceal
--     autocmd!
--     autocmd BufReadPost * setlocal conceallevel=0
--   augroup END
-- ]]

vim.cmd [[
  augroup markdown_conceal
    autocmd!
    autocmd BufReadPost,FileType markdown setlocal conceallevel=0
  augroup END
]]
