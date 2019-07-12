if type -q lsd
  alias l "lsd --all --human-readable --long --date=relative"
  alias lo "lsd --all -human-readable --long --date=relative --timesort --reverse"
  alias ll "lsd --all -human-readable --long --date=relative --timesort"
  alias l1 "lsd --all -oneline"
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

alias here "printf (pwd) | xsel --clipboard"
alias there 'cd (xsel --clipboard)'

# alias vims "env TERM=xterm-256color vim -S Session.vim"
# alias vim "env TERM=xterm-256color vim -p"
# alias vims "env TERM=xterm-256color vim.athena-py2 -S Session.vim"
# alias vim "env TERM=xterm-256color vim.athena-py2 -p"

# Only in Kubuntu
# alias vi "vim.athena-py2 -u NONE"
# alias vim "vim.athena-py2"
# alias nv "env TERM=xterm-256color nvim -p"

alias vi "nvim -u NONE"

alias gc "git commit"
alias gcv "git commit --no-verify"

# alias lost "clear; tail -n 52 ~/lost.txt; cat >> ~/lost.txt"
alias lost "cat ~/lost.txt; cat >> ~/lost.txt"

# alias privateOn='encfs ~/Dropbox/.private/ ~/Privado'
# alias privateOff='fusermount -u /home/$USER/Privado'

# Top 10 biggest files/directories in the current directory:
# https://plus.google.com/+MattMight/posts/6NJJeExpqQW
alias ducks='du -cks * | sort -rn | head'
# alias unp 'file-unpack'

# Disk ussage for each directory with depth=1
alias dud='du . -hd1'

# Find and remove *.pyc
# http://stackoverflow.com/questions/785519/how-do-i-remove-all-pyc-files-from-a-project
alias pycdel='find . -name \*.pyc -delete'

alias mkenv="virtualenv -p python3 .env"
alias mkvenv="virtualenv -p python3 .venv"
alias ienv="source .env/bin/activate.fish"
alias ivenv="source .env/bin/activate.fish"
alias oenv="deactivate"

alias initpy='touch __init__.py'
function mkpy
    mkdir "$argv"; and touch $argv/__init__.py
end

# git
abbr -a g 'git'
abbr -a gi 'git init'
abbr -a gs 'git status -u'
# Source: https://coderwall.com/p/euwpig/a-better-git-log
alias gh 'git log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit'
alias ghd 'git log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit -p'
alias gl 'git log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit'
alias gld 'git log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit -p'
# ---
alias gconfdiff 'git diff --diff-filter=U'
alias gconflict 'git diff --name-only --diff-filter=U'
abbr -a gd 'git diff'
abbr -a ga 'git add .'
abbr -a gc 'git commit -am'
abbr -a gll 'git pull'
abbr -a gp 'git push'
abbr -a gls 'git branch -a'
abbr -a gpom 'git push -u origin master'
abbr -a gg 'git fetch; and git checkout'
abbr -a gch 'git checkout'
abbr -a gbr 'git checkout -b'
abbr -a gfe 'git checkout -b feature/'
abbr -a gfi 'git checkout -b fix/'
abbr -a gdev 'git checkout develop'
abbr -a gm 'git merge --no-ff'
abbr -a g+ 'git stash --include-untracked'
abbr -a g- 'git stash apply'
abbr -a gsl 'git stash list'
abbr -a gundo 'git reset HEAD~'
abbr -a gunmerge 'git merge --abort'
abbr -a gmfe 'git checkout develop; and git merge --no-ff feature/'

# screen
alias scr 'env TERM=xterm-256color screen -x; or env TERM=xterm-256color screen'

# Deepo
abbr -a deepo "nvidia-docker run --rm ufoym/deepo"

# .the-bootstrap
alias .tbcd 'cd ~/.the-bootstrap'
alias .tbed 'cd ~/.the-bootstrap; and eval $EDITOR'

if type -q fzf
  alias v 'eval $EDITOR "(fzf --height 40% --layout=reverse --border)"'

  # https://github.com/junegunn/fzf/wiki/Examples-(fish)
  function gcf -d "Fuzzy-find and checkout a branch"
    git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
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
