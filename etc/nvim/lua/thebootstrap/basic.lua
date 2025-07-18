vim.opt.swapfile = true
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.incsearch = true

vim.opt.clipboard = "unnamedplus"

vim.opt.conceallevel = 0

-- Wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = {'list:longest', 'full'}

-- Sessions
vim.opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- pyenv setup:
-- $ pyenv virtualenv 3.11 neovim
-- $ pyenv activate neovim
-- $ pip install neovim
vim.g.python3_host_prog = os.getenv("HOME") .. '/.pyenv/versions/neovim/bin/python'

-- Remember cursor position
vim.cmd [[
  augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  augroup END
]]
