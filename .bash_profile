PAGER="less -SF"
EDITOR="vim"
force_color_prompt=yes

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
fi

function aescrypt() {
    tar cz "$1" | openssl enc -aes-256-cbc -e > "$1.tar.gz.enc"
}

function aesdecrypt() {
    openssl enc -aes-256-cbc -d -in "$1" | tar xz
}

function current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

# Oh-My-Zsh aliases
alias ..="cd .."
alias ...="cd ../.."
# Git
alias gc="git commit -v"
alias gca!="git commit -v -a --ammend"
alias gb="git branch"
alias gba="git branch -a"
alias gaa="git add --all"
alias ga="git add"
alias gcm="git checkout master"
alias gco="git checkout"
alias gd="git diff"
alias gfa="git fetch --all --prune"
alias gpsup="git push --set-upstream origin $(current_branch)"
alias gl="git pull"
alias glgga="git log --color --graph --decorate --all"
alias gloga="git log --oneline --decorate --color --graph --all"
alias grbi="git rebase -i"
alias grb="git rebase"
alias grbm="git rebase master"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"
alias grh="git reset HEAD"
alias gst="git status"

alias gtracked="git log --pretty=format: --name-only --diff-filter=A | sort - | sed '/^$/d'"
alias pyinit="python3 -m venv venv"
alias lsa="ls -lah"

alias gitprotect="git ls-files --others --exclude-standard -z | xargs -0 tar czvf ~/backup-untracked.tar"
alias dnsconfig="sudo vim /usr/local/etc/dnsmasq.conf"
alias nginxrestart="sudo /usr/local/etc/nginx/restart.sh"
alias nginxconfig="sudo vim /usr/local/etc/nginx/nginx.conf"
alias refreshdns="sudo killall -HUP mDNSResponder && sudo /usr/local/etc/reset.sh"
alias ntree="tree -I node_modules"

alias zshconfig="vim ~/.zshrc"
alias psave="pip freeze > requirements.txt"
alias pload="pip install -r requirements.txt"
alias penv="virtualenv venv"
alias pact="source ./venv/bin/activate"
# alias files="nautilus --browser"
alias cls="clear"
alias ports="netstat -lnpt"
alias gdiff="git diff --color=always -- . ':(exclude)*package-lock.json' | less"
alias localgitignore="vim .git/info/exclude"
alias openc="open -a \"Google Chrome\""
alias code="open -a \"Visual Studio Code\""
alias subl="open -a \"Sublime Text\""
alias bashreset="source ~/.zshrc"
alias gitwho="git log --diff-filter=A -- "
alias gca!="git commit -v --amend"
alias genpw="openssl rand -base64 32"
alias dirsize="du -hx —max-depth=1 ./"
alias t='tmux attach || tmux new-session'
alias tl='tmux list-sessions'
alias ta='tmux attach -t'
alias listports='lsof -nP +c 15 | grep LISTEN'

files() { nautilus --browser $1 & }
# PATH="$HOME/bin:$HOME/.local/bin:/usr/local/lib/node_modules/
# :$(npm bin):$PATH"

NODE_ENV=development

export PATH=$PATH:./node_modules/.bin:/usr/local/go/bin:"$HOME/bin:$HOME/.local/bin:/usr/local/lib/node_modules/:/usr/local/bin/node:/usr/local/lib/python3.7/site-packages/:$(npm bin):$PATH:./node_modules/:node_modules/:$HOME/bin/mongodb-osx-x86_64-4.0.2/bin/"

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# This line allows pip install psycopg2 to work
export LDFLAGS="-L/usr/local/opt/openssl/lib"

export LESS='-R'
export LESSOPEN='|pygmentize -g %s'
export NODE_PATH="/usr/local/lib/node_modules"

