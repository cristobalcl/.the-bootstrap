Vim/NeoVim configuration
========================

Installed plugins
-----------------
* [vim-kalisi](https://github.com/freeo/vim-kalisi)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
* [vim-nerdtree-syntax-highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)
* [fzf](https://github.com/junegunn/fzf)
* [fzf.vim](https://github.com/junegunn/fzf.vim)
* [vim-airline](https://github.com/vim-airline/vim-airline)
* [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
* [vim-easymotion](https://github.com/easymotion/vim-easymotion)
* [vim-commentary](https://github.com/tpope/vim-commentary)
* [vim-surround](https://github.com/tpope/vim-surround)
* [indentLine](https://github.com/Yggdroot/indentLine)
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* [jedi-vim](https://github.com/davidhalter/jedi-vim)
* [vim-polyglot](https://github.com/sheerun/vim-polyglot)
* [vim-markdown](https://github.com/gabrielelana/vim-markdown)
* [delimitMate](https://github.com/Raimondi/delimitMate)
* [coc.nvim](https://github.com/neoclide/coc.nvim)
* [vim-node-rpc](https://github.com/neoclide/vim-node-rpc)
* [vista.vim](https://github.com/liuchengxu/vista.vim)
* [goyo.vim](https://github.com/junegunn/goyo.vim)
* [limelight.vim](https://github.com/junegunn/limelight.vim)
* [vimwiki](https://github.com/vimwiki/vimwiki)
* [ultisnips](https://github.com/SirVer/ultisnips)
* [codi.vim](https://github.com/metakirby5/codi.vim)
* [vim-devicons](https://github.com/ryanoasis/vim-devicons)

Customized key binding
----------------------
* `C-x C-l`: line completion
* `C-o`, `C-i`: jump back, jump forward (out/in)
* `ds'`, `ds"`: remove quotes (' or ")
* `AMOUNT C-a`: add AMOUNT to number under cursor, if no AMOUNT specified then add one
* `,m`: switch mouse on/off
* `,l`: switch cursor line on/off
* `,n`: switch line numbers on/off
* `,n`: switch relative line numbers on/off
* `-`: enter command mode
* `jklñ`: left, down, up, right
* `ARROW KEYS`: move in visual lines
* `C-w jklñ`: go to left, down, up, right panel
* `00`: beginning of the line
* `<SPACE><SPACE>`: end of the line
* `gb`: go back
* `,zz`: center de current line in the screen
* `s`: jump anywhere typing two characters and then the label
* `C-h`, `C-j`: move between tabs
* `A-PageUp`, `A-PageUp`: move tab
* `C-t`: new tab
* `,s`: clear search
* `,G`: grep in open buffers
* `\`: grep
* `+`: grep this word
* `,c`: switch showing special characters on/off
* `,z`: hightlight all instances of word under cursor, when idle
* `,f`: open file tree
* `,F`: search file
* `,B`: search buffer
* `.`: repeat last action and move to the beginning of the edition
* `Y`: copy until the end of the line
* `,p`: paste yank
* `qq`: start recording macro `q`
* `q`: end recording macro
* `QQ`: run macro `q`
* `F2`: switch paste mode on/off
* `gw`: swap words
* `gl`: append line after next line
* `gL`: cut line and paste before this line
* `C-Up`,`C-Down`,`C-l`, `C-k`: move line or visual selection up and down
* `,S`: remove spaces at the end of the line
* `gV`: select what you just pasted
* `,v`: select until end of the line
* `,u`, `,U`: change case of whole word
* `,"`, `,'`: surround word or visual selection with " or '
* `~`: change between lower case, UPPER CASE and Tittle Case
* `gs`, `gy`, `gi`, `gr`: go to definition, type definition, implementation or references
* `K`: show documentation in preview window
* `,rn`: rename current word
* `,t`: format region or visual selection
* `,a`: do codeAction of selected region, ex: `<leader>aap` for current paragraph
* `,ac`: do codeAction of current line
* `,qf`: fix autofix problem of current line
* `:Format`: format current buffer
* `:Fold`: fold current buffer
* `SPC a`: show all diagnostics
* `SPC e`: manage extensions
* `SPC c`: list commands
* `SPC o`: find symbol of current document
* `SPC s`: search workspace symbols
* `SPC j`: do default action for next item.
* `SPC k`: do default action for previous item.
* `SPC p`: resume latest coc list
* `:C`: open coc config
* `SPC t`: open/close symbols & tags panel
* `SPC f`: fuzzy find symbol or tag
* `M-F5`: show spell checker suggestions
* `C-s`: activate spell checker for Spanish
* `C-g`: activate spell checker for English
* `M-F6`: deactivate spell checker
* `F3`: count words of the document
* `:Goyo`: distraction-free writing
