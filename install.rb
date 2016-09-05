#!/usr/bin/env ruby
require 'fileutils'
require 'pathname'

def mkdir dir
  `mkdir #{dir}`
end

def home_path file
  Dir.home + '/' + file
end

def dotfile_path file
  home_path ".dotfiles/#{file}"
end

def zsh_path file
  home_path ".antigen/"
end

def rename_if_exists src_item, dest_item
  FileUtils.move src_item, dest_item if FileTest.exists? src_item
end

def remove_if_exists item
  FileUtils.remove item if FileTest.exist? item
end

def backup item
  rename_if_exists item, "#{item}.backup"
end

def clone git_path, dest
  `git clone https://github.com/#{git_path}.git #{dest}`
end

def link src, dest
  FileUtils.symlink src, dest
end

def backup_and_link src, dest
  backup dest
  link src, dest
end

def install_homebrew
  `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
end

def brew command
  `brew #{command}`
end

def install_homebrew_cask
  brew 'tap homebrew/bundle'
end

def install_apps
  brew 'bundle'
end

def install_mjolnir_config
  `echo 'rocks_servers = { "http://rocks.moonscript.org" }' >> /usr/local/etc/luarocks52/config-5.2.lua`
  `luarocks install mjolnir.hotkey`
  `luarocks install mjolnir.application`
  `luarocks install mjolnir.screen`
  mkdir home_path('.mjolnir')
  backup_and_link dotfile_path('mjolnir'), home_path('.mjolnir/init.lua')
end

def install_fzf_scripts
  fzf_version = `fzf --version`.delete("\n")
  `/usr/local/Cellar/fzf/#{fzf_version}/install`
end

def install_ycm
  `bash ~/.vim/bundle/YouCompleteMe/install.sh --clang-completer`
end

def change_shell shell
  `chsh -s \`which #{shell}\``
end

def start_shell shell
  `#{shell}`
end

def install_dotfile file
  backup_and_link dotfile_path(file), home_path(".#{file}")
end

def install_zsh_plugins
  backup home_path('.antigen')
  clone 'zsh-users/antigen', home_path('.antigen')
  install_dotfile 'zshrc'
end

def install_vim_plugins
  install_dotfile 'vimrc'
  backup home_path('.vim')
  clone 'gmarik/Vundle.vim', home_path('.vim/bundle/Vundle.vim')
  `vim +PluginInstall +qall`
end

def install_tmux_plugins
  install_dotfile 'tmux.conf'
  clone 'tmux-plugins/tmux-yank', dotfile_path('tmux-yank')
end

def install_pip
  `sudo easy_install pip`
end

def install_pip
  `sudo easy_install pip`
end

def disable_gatekeeper
  'sudo spctl --master-disable'
end

def config_alfred
  disable_gatekeeper
  `cp #{dotfile_path('alfred')} #{home_path('Library/Application Support/Alfred 2/Alfred.alfredpreferences/preferences/features/clipboard')}`
end

def config_iterm
  `cp #{dotfile_path('iterm')} #{home_path('Library/Preferences/com.googlecode.iterm2.plist')}`
end

def config_osx
  `source #{dotfile_path('osx')}`
end

def duti path
  `duti #{path}`
end

def config_default_apps
  duti dotfile_path('duti')
end

install_zsh_plugins
install_vim_plugins
install_tmux_plugins

install_dotfile 'gitconfig'

install_homebrew
install_homebrew_cask
install_apps
install_mjolnir_config
install_fzf_scripts
install_ycm
install_pip

config_alfred
config_iterm
config_osx
config_default_apps

change_shell 'zsh'
start_shell 'zsh'
