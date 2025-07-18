-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- local function my_on_attach(bufnr)
--   local api = require "nvim-tree.api"

--   local function opts(desc)
--     return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--   end

--   -- default mappings
--   api.config.mappings.default_on_attach(bufnr)

--   -- custom mappings
--   vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent,        opts("Up"))
--   vim.keymap.set("n", "?",     api.tree.toggle_help,                  opts("Help"))
--   vim.keymap.set("n", "-", ":", { noremap = true })
-- end

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- -- copy default mappings here from defaults in next section
  -- vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
  -- vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
  -- ---
  -- -- OR use all default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- -- remove a default
  -- vim.keymap.del("n", "<C-]>", { buffer = bufnr })

  -- override a default
  -- vim.keymap.set("n", "<C-e>", api.tree.reload, opts("Refresh"))
  vim.keymap.set("n", "-", ":", { buffer = bufnr, noremap = true })

  -- add your mappings
  vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
  vim.keymap.set("n", "<leader>h", api.tree.change_root_to_node, opts("CD"))
  ---
end

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = my_on_attach,
})

-- Key mapping
vim.keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
