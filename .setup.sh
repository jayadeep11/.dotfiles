#!/bin/bash

# Install Zsh and Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/chrissicool/zsh-256color ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-256color

# Install Tpm for Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Define package names
packages=(
  stow
  lazygit
  wezterm
  fzf
  fd
  picom
  ripgrep
  jdk-openjdk
  go
  go-tools
  ninja
  cmake
  sshfs
  composer
  rustup
  vlc
  zoom
  gparted
  xfce4-screenshooter
  spectacle
  pipewire
  pipewire-alsa
  pipewire-jack
  pipewire-pulse
  pavucontrol
  wireplumber
  pipewire-zeroconf
  filelight
  xclip
  unzip
  rofi
  tmux
  brightnessctl
  clang
  obs-studio
  sof-firmware
  bat
  alsa-ucm-conf
  bluez
  bluez-utils
  blueman
  lsd
  zoxide
  ripgrep
  hyprland
)

# Install necessary packages
for package in "${packages[@]}"; do
  if ! pacman -Qi "$package" &>/dev/null; then
    sudo pacman -Syu "$package"
  else
    echo "$package is already installed."
  fi
done

git clone https://github.com/jayadeep11/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

sudo systemctl enable bluetooth.service

stow */


