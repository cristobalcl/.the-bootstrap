Vim/NeoVim configuration
========================

Installed plugins
-----------------
* [vim-kalisi](https://github.com/freeo/vim-kalisi)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
* [vim-nerdtree-syntax-highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)
* [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
* [fzf](https://github.com/junegunn/fzf)
* [fzf.vim](https://github.com/junegunn/fzf.vim)
* [vim-airline](https://github.com/vim-airline/vim-airline)
* [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
* [vim-easymotion](https://github.com/easymotion/vim-easymotion)
* [quick-scope](https://github.com/unblevable/quick-scope)
* [vim-commentary](https://github.com/tpope/vim-commentary)
* [vim-surround](https://github.com/tpope/vim-surround)
* [indentLine](https://github.com/Yggdroot/indentLine)
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
* [vim-polyglot](https://github.com/sheerun/vim-polyglot)
* [dart-vim-plugin](https://github.com/dart-lang/dart-vim-plugin)
* [tabular](https://github.com/godlygeek/tabular)
* [vim-markdown](https://github.com/gabrielelana/vim-markdown)
* [delimitMate](https://github.com/Raimondi/delimitMate)
* [vim-cycle](https://github.com/zef/vim-cycle)
* [vim-lsp](https://github.com/prabirshrestha/vim-lsp)
* [vim-lsp-settings](https://github.com/mattn/vim-lsp-settings)
* [asyncomplete.vim](https://github.com/prabirshrestha/asyncomplete.vim)
* [asyncomplete-lsp.vim](https://github.com/prabirshrestha/asyncomplete-lsp.vim)
* [ale](https://github.com/dense-analysis/ale)
* [ultisnips](https://github.com/SirVer/ultisnips)
* [vim-snippets](https://github.com/honza/vim-snippets)
* [asyncomplete-ultisnips.vim](https://github.com/prabirshrestha/asyncomplete-ultisnips.vim)
* [vista.vim](https://github.com/liuchengxu/vista.vim)
* [goyo.vim](https://github.com/junegunn/goyo.vim)
* [limelight.vim](https://github.com/junegunn/limelight.vim)
* [vimwiki](https://github.com/vimwiki/vimwiki)
* [codi.vim](https://github.com/metakirby5/codi.vim)
* [vim-devicons](https://github.com/ryanoasis/vim-devicons)

Customized key binding
----------------------
* `gi`: go insert mode in the last insert location
* `C-d`, `C-u`: page up, page down
* `C-x C-l`: line completion
* `C-o`, `C-i`: jump back, jump forward (out/in)
* `ds'`, `ds"`: remove quotes (' or ")
* `AMOUNT C-a`: add AMOUNT to number under cursor, if no AMOUNT specified then add one (or cycle through words)
* `AMOUNT C-x`: subtract AMOUNT to number under cursor, if no AMOUNT specified then subtract one (or cycle through words)
* `,m`: switch mouse on/off
* `,l`: switch cursor line on/off
* `,n`: switch line numbers on/off
* `,n`: switch relative line numbers on/off
* `-`: enter command mode
* `jklñ`: left, down, up, right
* `C-w jklñ`: go to left, down, up, right panel
* `hj`: beginning of the line
* `hñ`: end of the line
* `gb`: go back
* `,zz`: center de current line in the screen
* `s`: jump anywhere typing two characters and then the label
* `zR`: open all folds
* `zM`: close all folds
* `zi`: toggle folds
* `ENTER`: open/close folds (in visual mode create a fold)
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
* `,p`: show full filename and path
* `gF`: open file under cursor in a horizontal split
* `gFF`: open file under cursor in a new tab
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
* `,"`, `,'`, `,(`, `,[`, `,{`: surround word or visual selection with ", ', (), [] or {}
* `,)`, `,]`: interchange () and []
* `~`: change between lower case, UPPER CASE and Tittle Case
* `SPC t`: open/close symbols & tags panel
* `M-F5`: show spell checker suggestions
* `C-s`: activate spell checker for Spanish
* `C-g`: activate spell checker for English
* `M-F6`: deactivate spell checker
* `F3`: count words of the document
* `,=`: underline word with "=" (Markdown)
* `,-`: underline word with "-" (Markdown)
* `:Goyo`: distraction-free writing
* `,ww`: open default VimWiki
* `,wt`: open default VimWiki in a new tab
* `,ws`: select VimWiki to open
* `,wd`: delete current VimWiki file
* `,wr`: rename current VimWiki file
* `,ev`: edit vimrc
* `,sv`: run vimrc
