. ~/.config/fish/aliases.fish

# Disable copy deleted words to clipboard
set FISH_CLIPBOARD_CMD "cat"

if command -v nvim > /dev/null
  set -gx EDITOR nvim
else
  set -gx EDITOR vim
end

set -gx  LC_ALL en_US.UTF-8
set -gx PYTHONIOENCODING UTF-8
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

function fish_greeting
    # set_color $fish_color_autosuggestion
    # uname -nmsr
    # echo (lsb_release -s -d) "|" (lsb_release -s -r) (lsb_release -s -c)
    # uptime
    # echo
    # ~/bin/packt_offer.sh full
    # echo
    # set_color normal
end

if test -e $HOME/bin
    set PATH $PATH $HOME/bin
end

if test -e $HOME/.local/bin
    set PATH $PATH $HOME/.local/bin
end

if test -e /snap/bin
    set PATH $PATH /snap/bin
end

if test -e $HOME/Programas/flutter/bin
    set PATH $PATH $HOME/Programas/flutter/bin $HOME/Programas/flutter/.pub-cache/bin
end

if test -e $HOME/Library/Python/3.7/bin
    set PATH $PATH $HOME/Library/Python/3.7/bin
end

if test -e $HOME/Library/Python/3.8/bin
    set PATH $PATH $HOME/Library/Python/3.8/bin
end

if test -e $HOME/.poetry/bin
    set PATH $PATH $HOME/.poetry/bin
end

if test -e $HOME/.cargo/bin
    set PATH $PATH $HOME/.cargo/bin
end

# if test -e /root/.cargo/bin
#     set PATH $PATH /root/.cargo/bin
# end

if test -e $HOME/.local/share/nvim/lsp_servers/python
    set PATH $PATH $HOME/.local/share/nvim/lsp_servers/python
end

if type -q powerline-shell
    function fish_prompt
        powerline-shell --shell bare $status
    end
else
    set PYTHON3_USER_PATH (python3 -c "import sys; print(next((x for x in sys.path if x.startswith(\"$HOME\")), ['']))")

    if test -e "$PYTHON3_USER_PATH/powerline/bindings/fish/"
        set fish_function_path $fish_function_path "$PYTHON3_USER_PATH/powerline/bindings/fish/"
        powerline-setup
    end
end

if type -q fzf
  set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
end

set CDPATH $CDPATH .

if test -e $HOME/Proyectos
    set CDPATH $CDPATH $HOME/Proyectos
end

set LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64/ /usr/local/cuda-9.0/lib64

if test -e /usr/lib/jvm/java-8-openjdk-amd64/
    set JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
    export JAVA_HOME
end

# Anaconda
if test -e $HOME/Programas/anaconda3/bin/
    set PATH $PATH $HOME/Programas/anaconda3/bin/
    source $HOME/Programas/anaconda3/etc/fish/conf.d/conda.fish
    # set fish_user_paths $fish_user_paths $HOME/Programas/anaconda3/bin/
end

# if test -e ~/.nvm/nvm.sh
#   set -x NVM_DIR "$HOME/.nvm"
#   bash "$NVM_DIR/nvm.sh"
# end

if test -e $HOME/.nvm/versions/node/v22.13.1/bin/node
  fish_add_path $HOME/.nvm/versions/node/v22.13.1/bin
end

if test -e /usr/lib/dart/bin/
  set PATH $PATH /usr/lib/dart/bin/
end

eval (ssh-agent -c) > /dev/null

if test -e $HOME/.pyenv
  set -Ux PYENV_ROOT $HOME/.pyenv
  fish_add_path $PYENV_ROOT/bin
  status --is-interactive; and pyenv init - fish | source
end

if test -e $HOME/.local/share/solana/install/active_release/bin
  set PATH $PATH $HOME/.local/share/solana/install/active_release/bin
end

if type -q direnv
  direnv hook fish | source
end

# Replace docker with podman if available
if type -q podman
  alias docker podman

  set -x CDK_DOCKER podman
end
