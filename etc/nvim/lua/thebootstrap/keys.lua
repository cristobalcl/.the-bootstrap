vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Shorten function name
-- keymap(MODE, KEY, COMMAND, OPTIONS)
local keymap = vim.keymap.set

-- Modes:
-- + normal = "n",
-- + insert = "i",
-- + visual = "v",
-- + visual block = "x",
-- + term = "t",
-- + command = "c",

local opts = { noremap = true, silent = true }

-- Basic
keymap("n", "-", ":", { noremap = true })
keymap("n", "Q", "<Nop>", opts)

-- Movement
keymap("n", "ñ", "l", opts)
keymap("n", "l", "k", opts)
keymap("n", "k", "j", opts)
keymap("n", "j", "h", opts)

keymap("v", "ñ", "l", opts)
keymap("v", "l", "k", opts)
keymap("v", "k", "j", opts)
keymap("v", "j", "h", opts)

-- First column
keymap("n", "hh", "0", opts)
keymap("v", "hh", "0", opts)

-- First char
keymap("n", "hj", "^", opts)
keymap("v", "hj", "^", opts)

-- End of the line
keymap("n", "hñ", "$", opts)
keymap("v", "hñ", "$", opts)

-- Center the line of the cursor
keymap("n", "<Leader>zz", ":let &scrolloff=999-&scrolloff<CR>", opts)

-- Edition
keymap("", ".", ".`[", { noremap = false })
keymap("n", "Y", "y$", { noremap = true })
-- keymap("v", "<leader>p", "\"0p", { noremap = true })
keymap("x", "<leader>p", [["_dP]])
keymap("n", "QQ", "@q", { noremap = true })

-- Move line/block
keymap("n", "<C-Down>", ":m+<CR>==", opts)
keymap("n", "<C-Up>", ":m-2<CR>==", opts)
keymap("i", "<C-Down>", "<Esc>:m+<CR>==gi", opts)
keymap("i", "<C-Up>", "<Esc>:m-2<CR>==gi", opts)
keymap("v", "<C-Down>", ":m'>+<CR>gv=gv", opts)
keymap("v", "<C-Up>", ":m-2<CR>gv=gv", opts)

keymap("n", "<C-k>", ":m+<CR>==", opts)
keymap("n", "<C-l>", ":m-2<CR>==", opts)
keymap("i", "<C-k>", "<Esc>:m+<CR>==gi", opts)
keymap("i", "<C-l>", "<Esc>:m-2<CR>==gi", opts)
keymap("v", "<C-k>", ":m'>+<CR>gv=gv", opts)
keymap("v", "<C-l>", ":m-2<CR>gv=gv", opts)

-- Remove blank spaces at the end of the line
keymap("n", "<leader>S", ":%s/[ \\t]\\+$//g<CR>", opts)

keymap("n", "gV", [[:lua GoToLastPasteStart()<CR>]], opts)
function _G.GoToLastPasteStart()
    vim.cmd("normal! `[v`]")
end

keymap("n", "<leader>v", "v$ho", opts)

-- Buffers
-- Go Back
vim.api.nvim_set_keymap("n", "gb", "<C-o>", { noremap = true })

-- Panels
keymap("n", "<C-w>j", "<C-w><left>", opts)
keymap("n", "<C-w>k", "<C-w><down>", opts)
keymap("n", "<C-w>l", "<C-w><up>", opts)
keymap("n", "<C-w>ñ", "<C-w><right>", opts)

-- Tabs
-- Navigate tabs
keymap("n", "<C-h>", "gT", opts)
keymap("n", "<C-j>", "gt", opts)

-- Create tabs
keymap("n", "<C-t>", ":tabnew<CR>", opts)
keymap("i", "<C-t>", "<Esc>:tabnew<CR>", opts)

-- Move tab
keymap("n", "<A-PageUp>", ":tabmove -1<CR>", opts)
keymap("n", "<A-PageDown>", ":tabmove +1<CR>", opts)

-- Search
keymap("n", "<leader>s", ":nohlsearch<CR>", opts)

-- Center the cursor when searching
-- keymap("n", "n", "nzzzv", opts)
-- keymap("n", "N", "Nzzzv", opts)

keymap("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Files
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Vmap for maintain Visual Mode after shifting > and <
-- Source: https://vim-bootstrap.com/
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

--
function FormatBufferWithBlack()
    -- Save the current position
    local curpos = vim.api.nvim_win_get_cursor(0)

    -- Write buffer to a temporary file
    local tmpfile = vim.fn.tempname() .. ".py"
    vim.cmd('w ' .. tmpfile)

    -- Command to activate the virtual environment, run black, and then deactivate
    local command = ".venv/bin/black " .. tmpfile

    -- Execute the command
    vim.cmd('! ' .. command)

    -- Read the formatted content back into the buffer
    vim.cmd('e ' .. tmpfile)

    -- Delete the temporary file
    vim.loop.fs_unlink(tmpfile)

    -- Restore the cursor position
    vim.api.nvim_win_set_cursor(0, curpos)
end

-- Mapping the function to a key combination
keymap("n", "<leader>b", ":lua FormatBufferWithBlack()<CR>", opts)
