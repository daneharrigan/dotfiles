autoload -U compinit; compinit
autoload edit-command-line

zle -N edit-command-line

setopt NO_BEEP
setopt append_history
#setopt extended_history
#setopt hist_expire_dups_first
#setopt hist_ignore_dups
#setopt hist_ignore_space
#setopt hist_verify
#setopt inc_append_history
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
export PATH=$PATH:/usr/local/bin
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/local/kubebuilder/bin
export PATH=$PATH:/usr/local/lib/node_modules/*/bin
export PATH=/usr/local/opt/node@10/bin:$PATH
export RBENV_ROOT=/usr/local/var/rbenv

if [[ -z "${VIM_COLOR}" ]]; then
export VIM_COLOR=hyper-dark
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

cdpath=$GOPATH/src

function prompt_char {
  if [[ whoami = "root" ]]; then
    echo "#"; return
  fi
  echo "$"
}

prompt="%1~$(prompt_char) "

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
