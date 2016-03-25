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


export PATH="$HOME/.rbenv/bin:$PATH"
export EDITOR="/usr/local/bin/vim"


eval "$(rbenv init -)" 


alias tmux="tmux -2"
alias fuck="curl -X POST -d 'Rebooting=1&RestoreFactoryDefault=0' 'http://192.168.100.1/goform/RgConfiguration.pl'"
alias ngrok="ngrok http -subdomain=kirby"

# enable vim keybindings in the shell
bindkey -v

# enable fzf awesomeness. Make sure to do this after enabling vim keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

setopt HIST_IGNORE_SPACE # don't save to zsh history if suffixed with a space

alias npmo="npm --cache-min 9999999 install"

