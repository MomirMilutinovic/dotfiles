#!/usr/bin/env bash

# Install alacritty
sudo apt install curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env && rustup default nightly && rustup update
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 gzip
cargo install alacritty
# Create desktop entry for alacritty
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# Install dependencies
sudo apt install i3 polybar powerline neovim tmux fzf zsh lm-sensors rofi picom

# Make directories for some config files
mkdir -p ~/.config/i3 


# Symlink configs into place
ln -sf ~/.dotfiles/alacritty/alacritty.yml ~/.alacritty.yml
ln -sf ~/.dotfiles/bash/bashrc ~/.bashrc
ln -sf ~/.dotfiles/i3/config ~/.config/i3/config
ln -sf ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/picom ~/.config/picom
ln -sf ~/.dotfiles/polybar ~/.config/polybar
ln -sf ~/.dotfiles/rofi ~/.config/rofi
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/.dotfiles/zsh/aliases ~/.aliases
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc

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
