local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>F", builtin.find_files, {})
vim.keymap.set("n", "<leader>G", builtin.git_files, {})
vim.keymap.set("n", "<leader>A", builtin.live_grep, {})
vim.keymap.set("n", "\\", builtin.live_grep, {})
vim.keymap.set("n", "+", builtin.grep_string, {})
vim.keymap.set("n", "<leader>B", builtin.buffers, {})
vim.keymap.set("n", "<leader>H", builtin.help_tags, {})

require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "%.git/", "node_modules/", "%.cache/", "%.venv" },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      additional_args = function(_)
        return { "--hidden" }
      end,
    },
  },
})
