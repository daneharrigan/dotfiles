autoload -U compinit; compinit
autoload edit-command-line

zle -N edit-command-line

setopt NO_BEEP
setopt append_history
setopt share_history

bindkey '^Xe'   edit-command-line
bindkey '\e[A'  up-line-or-history
bindkey '\e[B'  down-line-or-history
bindkey '\e[C'  forward-char
bindkey '\e[D'  backward-char
bindkey '\eOA'  up-line-or-history
bindkey '\eOB'  down-line-or-history
bindkey '\eOC'  forward-char
bindkey '\eOD'  backward-char
bindkey -e
bindkey '^r' history-incremental-search-backward

alias uuidgen='ruby -rsecurerandom -e "print SecureRandom.uuid"'
alias vi=nvim # trying out neovim
alias now='echo $(date +"%Y%m%d%H%M")'

if [ -z $PROJECTS ]; then
  export PROJECTS=~/Projects
fi

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
export EDITOR=vi
export KEYTIMEOUT=1
export GO111MODULE=on
export GOPATH=$PROJECTS
export RBENV_ROOT=/usr/local/var/rbenv
export GPG_TTY=$(tty)

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

cdpath=$GOPATH/src
prompt="%1~%%%  "
path=(
  /bin
  /usr/bin
  /usr/local/bin
  /usr/local/lib/node_modules/*/bin
  /usr/local/opt/node@10/bin
  $GOPATH/bin
  $path
)

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
