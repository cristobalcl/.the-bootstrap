. ~/.config/fish/aliases.fish

# Disable copy deleted words to clipboard
set FISH_CLIPBOARD_CMD "cat"

set -gx EDITOR nv
# set -U EDITOR vim

function fish_greeting
	set_color $fish_color_autosuggestion
	uname -nmsr
	echo (lsb_release -s -d) "|" (lsb_release -s -r) (lsb_release -s -c)
	# uptime
    echo
    ~/bin/packt_offer.sh full
    echo
	set_color normal
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

if test -e $HOME/bin
    set PATH $PATH $HOME/bin
end

if test -e $HOME/.local/bin
    set PATH $PATH $HOME/.local/bin /snap/bin
end

if test -e /snap/bin
    set PATH $PATH /snap/bin
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

if test -e ~/.nvm/nvm.sh
	bass export NVM_DIR="$HOME/.nvm"
	bass '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'  # This loads nvm
end
