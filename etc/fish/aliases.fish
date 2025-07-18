if type -q lsd
  alias l "lsd --all --human-readable --long --date=relative"
  alias lo "lsd --all --human-readable --long --date=relative --timesort --reverse"
  alias ll "lsd --all --human-readable --long --date=relative --timesort"
  alias l1 "lsd --all --oneline"
  alias tree "lsd --tree"
else
  alias l "ls -hlA"
  alias lo "ls -hlAtr"
  alias ll "ls -hlASr"
  alias l1 "ls -1"
end

alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias , "cd -"
abbr -a -- + 'pushd .'
abbr -a -- - 'popd'
abbr -a chsh 'chmod +x *.sh'

function mkcd
    mkdir "$argv"; and cd "$argv"
end

# ? () { echo "$*" | bc -l; }
function =
	echo "$argv" | bc -l
end

function install_deb
    sudo dpkg -i "$argv"; and sudo apt-get -f install -y
end

alias today "date +%F"
# alias pylab='ipython -pylab'
# alias wcat='wget -qO-'

abbr -a plasma_restart 'kquitapp5 plasmashell && kstart5 plasmashell'

if type -q xsel
  alias here "printf (pwd) | xsel --clipboard"
  alias there 'cd (xsel --clipboard)'
  alias this "printf (basename (pwd)) | xsel --clipboard"
else
  if type -q pbcopy
    alias here "printf (pwd) | pbcopy"
    alias there 'cd (pbpaste)'
    alias this "basename (pwd) | pbcopy"
    alias this "printf (basename (pwd)) | pbcopy"
  end
end

# alias vims "env TERM=xterm-256color vim -S Session.vim"
# alias vim "env TERM=xterm-256color vim -p"
# alias vims "env TERM=xterm-256color vim.athena-py2 -S Session.vim"
# alias vim "env TERM=xterm-256color vim.athena-py2 -p"

# Only in Kubuntu
# alias vi "vim.athena-py2 -u NONE"
# alias vim "vim.athena-py2"
# alias nv "env TERM=xterm-256color nvim -p"

alias vi "nvim -u NONE"

# alias lost "clear; tail -n 52 ~/lost.txt; cat >> ~/lost.txt"
alias lost "cat ~/lost.txt; cat >> ~/lost.txt"

# alias privateOn='encfs ~/Dropbox/.private/ ~/Privado'
# alias privateOff='fusermount -u /home/$USER/Privado'

# Top 10 biggest files/directories in the current directory:
# https://plus.google.com/+MattMight/posts/6NJJeExpqQW
abbr -a ducks 'du -cks * | sort -rn | head'
# alias unp 'file-unpack'

# Disk usage for each directory with depth=1
abbr -a dud 'du . -hd1'

# Print MD5 fingerprint of a SSH public key
abbr -a ssh-finger 'ssh-keygen -l -E md5 -f'

# Python
# Find and remove *.pyc
# http://stackoverflow.com/questions/785519/how-do-i-remove-all-pyc-files-from-a-project
alias pycdel='find . -name \*.pyc -delete'

alias mkenv="python -m venv .venv; and .venv/bin/python -m pip install --upgrade pip; or true"
alias ienv="source .venv/bin/activate.fish"
alias oenv="deactivate"

abbr -a pi 'pip install'
abbr -a pir 'pip install -r requirements.txt'
abbr -a pif 'pip freeze'

abbr -a server 'python3 -m http.server'

if type -q python2.7
  alias py2="python2.7"
else if type -q python
  alias py2="python"
end

if type -q python3
  alias py="python3"
  alias py3="python3"
end

alias initpy='touch __init__.py'
function mkpy
    mkdir "$argv"; and touch $argv/__init__.py
end

# git
abbr -a g 'git'
abbr -a gi 'git init'
abbr -a gs 'git status -u'
# Source: https://coderwall.com/p/euwpig/a-better-git-log
# Conflict with GitHub cli:
alias ghi 'git log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit'
alias ghd 'git log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit -p'
alias gl 'git log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit'
alias gld 'git log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit -p'
# ---
alias gconfdiff 'git diff --diff-filter=U'
alias gconflict 'git diff --name-only --diff-filter=U'
abbr -a gd 'git diff'
abbr -a ga 'git add'
abbr -a gaa 'git add .'

abbr -a gc 'git commit -m'
abbr -a gca 'git commit -am'
abbr -a gcF 'git commit --no-verify -m'

# Based loosely on: https://hackmd.io/tRPFV2YGTLChBnunPLMhYg
abbr -a gdoc 'git commit -m "📝'
abbr -a gfeat 'git commit -m "✨'
abbr -a gclean 'git commit -m "♻️'
abbr -a gref 'git commit -m "♻️'
abbr -a gnit 'git commit -m "🥢'
abbr -a gsec 'git commit -m "🔒'
abbr -a gopt 'git commit -m "⚡'
abbr -a gconf 'git commit -m "👷'
abbr -a gcfg 'git commit -m "👷'
abbr -a gev 'git commit -m "🔊'
abbr -a gfix 'git commit -m "🐞'
abbr -a gbug 'git commit -m "🐞'

abbr -a gll 'git pull'
abbr -a gp 'git push'
abbr -a gls 'git branch -a'
abbr -a gpom 'git push -u origin master'
abbr -a gg 'git fetch; and git checkout'
abbr -a gch 'git checkout'
abbr -a gbr 'git checkout -b'
abbr -a gfe 'git checkout -b feature/'
abbr -a gfi 'git checkout -b fix/'
abbr -a gma 'git checkout master'
abbr -a gde 'git checkout develop'
abbr -a gm 'git merge --no-ff'
abbr -a g+ 'git stash --include-untracked'
abbr -a g- 'git stash apply'
abbr -a gsl 'git stash list'
abbr -a gundo 'git reset HEAD~'
abbr -a gunadd 'git restore --staged .'
abbr -a greset 'git reset --hard HEAD'
abbr -a gamv 'git add -A .'
abbr -a gunmerge 'git merge --abort'
abbr -a gmfe 'git checkout develop; and git merge --no-ff feature/'
abbr -a glsn 'git clean -xdn'
abbr -a gclean 'git clean -fd'
abbr -a gcleanall 'git clean -fdx'
abbr -a gr 'git remote'
abbr -a gru 'git remote get-url'
abbr -a grus 'git remote set-url'
abbr -a gra 'git remote add'
abbr -a gtouch 'git ls-files -m | xargs touch'

function gtag
  git tag "$argv"; and git push origin "$argv"
end

function gdeltag
  git tag -d "$argv"; and git push origin :refs/tags/"$argv"
end

# Docker
abbr -a dps 'docker ps'
abbr -a ds 'docker stop'
abbr -a db 'docker build -f Dockerfile . -t'
abbr -a dr 'docker run --rm'
abbr -a dser 'docker run -p 127.0.0.1:8888:8888/tcp --rm'
abbr -a dsh 'docker run --rm -it --entrypoint sh'
abbr -a dbsh 'docker run --rm -it --entrypoint bash'
abbr -a dmount 'docker run --rm -it --mount type=bind,source=(pwd),target=/local --entrypoint bash'
abbr -a dsp 'docker system prune'
abbr -a dexe 'docker exec -it'

# AWS
abbr -a alog 'aws sso login --no-browser'
abbr -a acheck 'aws sts get-caller-identity'

# screen
# alias scr 'env TERM=xterm-256color screen -x; or env TERM=xterm-256color screen'

# tmux
abbr -a tl 'tmux ls'
abbr -a ta 'tmux attach-session -t'
abbr -a tt 'tmux new-session -s (tmux ls | wc -l | awk \'{print $1}\')-(basename $PWD | sed 's/\.//') \; split-window -v -p 50 \; selectw -t 1 \; selectp -t 0 \;'

abbr -a tv 'tmux new-session -s (tmux ls | wc -l | awk \'{print $1}\')-(basename $PWD | sed 's/\.//') \; send-keys \'nvim\' C-m \; split-window -v -p 30 \; selectw -t 1 \; selectp -t 0 \;'
abbr -a tvw 'tmux new-session -s (tmux ls | wc -l | awk \'{print $1}\')-(basename $PWD | sed 's/\.//') \; send-keys \'nvim\' C-m \; split-window -v -p 30 \; new-window \; selectw -t 1 \; selectp -t 0 \;'
abbr -a tvww 'tmux new-session -s (tmux ls | wc -l | awk \'{print $1}\')-(basename $PWD | sed 's/\.//') \; send-keys \'nvim\' C-m \; split-window -v -p 30 \; new-window \; new-window \; selectw -t 1 \; selectp -t 0 \;'

abbr -a tran 'tmux new-session -s (tmux ls | wc -l | awk \'{print $1}\')-(basename $PWD | sed 's/\.//') \; send-keys \'ranger\' C-m \; split-window -v -p 30 \; selectw -t 1 \; selectp -t 0 \;'

# .tb
abbr -a .tbtp 'cd ~/.the-bootstrap; and tp'

# Poetry
abbr -a plock 'poetry lock --no-update'

# Deepo
abbr -a deepo "nvidia-docker run --rm ufoym/deepo"

# pass
abbr -a pl "pass ls"
abbr -a p "pass show"
abbr -a pp "upass"
abbr -a pe "pass edit"

# .the-bootstrap
alias .tbcd 'cd ~/.the-bootstrap'
alias .tbed 'cd ~/.the-bootstrap; and eval $EDITOR'
alias .tb 'cd ~/.the-bootstrap; and tp'

if type -q fzf
  alias v 'eval $EDITOR "(fzf --height 40% --layout=reverse --border)"'

  # https://github.com/junegunn/fzf/wiki/Examples-(fish)
  function gcf -d "Fuzzy-find and checkout a branch"
    git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
  end

  function tpa -d "Fuzzy-find and attach tmux session"
    tmux list-sessions -F '#{session_name}' | fzf | read -l result; and tmux attach-session -t "$result"
  end
end

if test -e $HOME/.pyenv
  alias py36 'eval $HOME/.pyenv/versions/3.6.0/bin/python'
  alias py37 'eval $HOME/.pyenv/versions/3.7.0/bin/python'
end

if type -q jq
  function jat
    cat "$argv" | jq
  end
end

abbr -a metro "dart run nylo_framework:main"

abbr -a coexp "gh copilot explain"
abbr -a cosug "gh copilot suggest"

# TODO XXX REMOVE
#abbr -a newnvim "NVIM_APPNAME=newnvim nvim"

function d
    if test (count $argv) -eq 0
      git diff --color
      git ls-files --others --exclude-standard -z | xargs -0 -n 1 git --no-pager diff /dev/null
    else
        git diff $argv
    end
end
