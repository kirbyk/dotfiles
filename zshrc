source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle encode64
antigen bundle gem
antigen bundle git
antigen bundle git-extras
antigen bundle heroku
antigen bundle osx
antigen bundle urltools
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen theme $HOME/.dotfiles kirbystheme --no-local-clone

antigen apply

################################################################################
#                                 ZSH config                                   #
################################################################################

# enable vim keybindings in the shell
bindkey -v

# don't save to zsh history if suffixed with a space
setopt HIST_IGNORE_SPACE 

################################################################################
#                                 ZSH aliases                                  #
################################################################################

# 256 color hack
alias tmux="tmux -2"

# reset my modem when the internet goes down
alias fuck="curl -X POST -d 'Rebooting=1&RestoreFactoryDefault=0' 'http://192.168.100.1/goform/RgConfiguration.pl'"

# Offline npm hack
alias npmo="npm --cache-min 9999999 install"
alias gbd="git recent"
alias gbc="git recent-checkout"

################################################################################
#                                 misc config                                  #
################################################################################

# default editor
export EDITOR="/usr/local/bin/vim"

# rbenv config
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)" 

# enable fzf awesomeness. Make sure to do this after enabling vim keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# # nvm config
# export NVM_DIR=~/.nvm
# . $(brew --prefix nvm)/nvm.sh

nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . $(brew --prefix nvm)/nvm.sh  # This loads nvm
    nvm "$@"
}

# Postgres commandline utils
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
