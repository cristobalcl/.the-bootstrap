local keymap = vim.api.nvim_set_keymap
local opts = { remap = yes }

keymap("n", '<Leader>"', 'ysiw"', opts)
keymap("v", '<Leader>"', 'S"', opts)

keymap("n", "<Leader>'", "ysiw'", opts)
keymap("v", "<Leader>'", "S'", opts)

keymap("n", "<Leader>(", "ysiw)", opts)
keymap("v", "<Leader>(", "S)", opts)

keymap("n", "<Leader>{", "ysiw}", opts)
keymap("v", "<Leader>{", "S}", opts)

keymap("n", "<Leader>[", "ysiw]", opts)
keymap("v", "<Leader>[", "S]", opts)
