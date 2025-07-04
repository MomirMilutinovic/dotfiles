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
sudo apt install i3 polybar powerline neovim tmux fzf zsh lm-sensors rofi picom libglib2.0-bin

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerline fonts
git clone --depth 1 https://github.com/powerline/fonts pl-fonts && cd pl-fonts
./install.sh
cd ..

# Install other fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/UbuntuMono/UbuntuMonoNerdFont-Regular.ttf

fc-cache

cd ~/.dotfiles

mkdir ~/.config/fontconfig/conf.d
curl -L "https://github.com/powerline/powerline/blob/develop/font/10-powerline-symbols.conf" \
  -o ~/.config/fontconfig/conf.d/10-powerline-symbols.conf


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

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


# Change shell to zsh
chsh -s /usr/bin/zsh

# Remember to drop .fonts into home
# Update font list
fc-cache -f -v

# Install McMojave GTK theme
git clone https://github.com/vinceliuice/Mojave-gtk-theme /tmp/mcmojave && cd /tmp/mcmojave && chmod +x install.sh && ./install.sh

# Set McMojave as GTK theme
ln -sf gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
