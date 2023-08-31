#!/usr/bin/env bash

# Install dependencies
sudo apt install i3-gaps polybar powerline nvim alacritty tmux fzf zsh lm-sensors

# Make directories for some config files
mkdir -p ~/.config/i3 ~/.config/nvim ~/.config/polybar


# Symlink configs into place
ln -sf alacritty/alacritty.yml ~/.alacritty.yml
ln -sf bash/bashrc ~/.bashrc
ln -sf i3/config ~/.config/i3/config
ln -sf nvim/init.vim ~/.config/nvim/init.vim
ln -sf polybar/config ~/.config/polybar/polybar/config
ln -sf tmux/tmux.conf ~/.tmux.conf
ln -sf vim/vimrc ~/.vimrc
ln -sf zsh/aliases ~/.aliases
ln -sf zsh/zshrc ~/.zshrc

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# Change shell to zsh
chsh -s /usr/bin/zsh

# Remember to drop .fonts into home
# Update font list
fc-cache -f -v

# Install McMojave GTK theme
git clone https://github.com/vinceliuice/Mojave-gtk-theme /tmp/mcmojave && cd /tmp/mcmojave && chmod +x install.sh && ./install.sh

# Set McMojave as GTK theme
ln -sf gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
