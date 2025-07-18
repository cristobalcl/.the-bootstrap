local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  -- lsp_zero.default_keymaps({buffer = bufnr})

  local opts = {buffer = bufnr, remap = false}

  -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>cws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>cd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>cca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>crr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>crn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  -- -- markdown-oxide: setup Markdown Oxide daily note commands
  -- if client.name == "markdown_oxide" then
  --   vim.api.nvim_create_user_command("Daily", function(args)
  --     local input = args.args

  --     vim.lsp.buf.execute_command({command="jump", arguments={input}})

  --   end, {desc = 'Open daily note', nargs = "*"})
  -- end
  -- -- --
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  -- ensure_installed = {"pylsp", "terraformls"},
  ensure_installed = {
    "pylsp",
    "tflint",
    -- "markdown_oxide",
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
  }
})

require"lspconfig".pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          -- ignore = {"E501"},
          maxLineLength = 99
        }
      }
    }
  }
}

-- -- markdown-oxide
-- local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- require("lspconfig").markdown_oxide.setup({
--   -- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
--   -- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
--   capabilities = vim.tbl_deep_extend(
--   'force',
--   capabilities,
--   {
--     workspace = {
--       didChangeWatchedFiles = {
--         dynamicRegistration = true,
--       },
--     },
--   }
--   ),
--   on_attach = on_attach -- configure your on attach config
-- })
-- -- --

require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

require("copilot_cmp").setup()

require("CopilotChat").setup ({})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}

-- require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

cmp.setup({
  sources = {
    {name = "copilot"},
    -- {name = "path"},
    {
      name = "nvim_lsp",
      -- -- markdown-oxide
      -- option = {
      --   markdown_oxide = {
      --     keyword_pattern = [[\(\k\| \|\/\|#\)\+]]
      --   }
      -- }
      -- -- --
    },
    -- {name = "nvim_lua"},
    -- {name = "luasnip"},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    -- ["<TAB>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    -- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({
      -- documentation says this is important.
      -- I don't know why.
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
  }),
})

-- Lspsaga:
require("lspsaga").setup({
  finder = {
    -- max_height = 0.6,
    keys = {
      shuttle = "w",
      toggle_or_open = "o",
      vsplit = "v",
      split = "s",
      tabe = "t",
      tabnew = "r",
      close = "q",
      quit = "<esc>",
    },
  },
  rename = {
    in_select = false,
    -- quit = "<C-k>",
  },
  symbols_in_winbar = {
    enable = true,
  },
  beacon = {
    enable = true,
  },
})
require("lspsaga.symbol.winbar").get_bar()

vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>")
vim.keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<cr>")
vim.keymap.set("n", "gT", "<cmd>Lspsaga peek_type_definition<cr>")
vim.keymap.set("n", "gS", "<cmd>Lspsaga finder<cr>")
vim.keymap.set("n", "gA", "<cmd>Lspsaga code_action<cr>")
vim.keymap.set("n", "gR", "<cmd>Lspsaga rename<cr>")
vim.keymap.set("n", "gO", "<cmd>Lspsaga outline<cr>")

-- TODO
-- :ProjectRename old_name new_name
-- vim.api.nvim_create_user_command("ProjectRename", function(args)
--   -- ...
-- end, { nargs = "*" })
-- --
