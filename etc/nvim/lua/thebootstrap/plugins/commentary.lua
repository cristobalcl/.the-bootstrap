-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "terraform",
--     command = "setlocal commentstring=#%s"
-- })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "terraform",
    callback = function()
        vim.opt_local.commentstring = "# %s"
    end,
})
