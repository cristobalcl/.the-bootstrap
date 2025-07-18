local bufferline = require('bufferline')
bufferline.setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
    separator_style = "slant", -- | "slope" | "thick" | "thin" | { 'any', 'any' },
    -- highlight = {underline = true, sp = "blue"},
    show_duplicate_prefix = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true -- use a "true" to enable the default, or set your own character
      }
    },
    numbers = function(opts)
      -- return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
      return string.format('%s', opts.raise(opts.ordinal))
    end,
    -- name_formatter = function(buf)  -- buf contains:
    --   -- name                | str        | the basename of the active file
    --   -- path                | str        | the full path of the active file
    --   -- bufnr               | int        | the number of the active buffer
    --   -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
    --   -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
    --   return buf.path
    -- end,
    ------
    --- count is an integer representing total count of errors
    --- level is a string "error" | "warning"
    --- this should return a string
    --- Don't get too fancy as this function will be executed a lot
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
  }
}

local function keymap(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

local function map_buffer_goto(index)
  keymap("n", "<leader>" .. tostring(index), "<cmd>lua require(\"bufferline\").go_to(" .. index .. ", true)<cr>")
end

for i = 1, 9 do
  map_buffer_goto(i)
end

-- Special case for $ (last buffer):
keymap("n", "<leader>$", "<cmd>lua require(\"bufferline\").go_to(-1, true)<cr>")

-- Move buffer (same as before):
keymap("n", "<leader>j", ":BufferLineMoveNext<CR>")
keymap("n", "<leader>h", ":BufferLineMovePrev<CR>")
