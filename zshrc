source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle brew
antigen bundle encode64
antigen bundle clvv/fasd
antigen bundle gem
antigen bundle git
antigen bundle git-extras
antigen bundle heroku
antigen bundle osx
antigen bundle urltools
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen theme dstufft

antigen apply

alias tmux="tmux -2"
