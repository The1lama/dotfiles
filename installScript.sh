#!/usr/bin/bash
##############################
#### Install applications ####
##############################

# Check for root privileges 
# Should not be run as root as we are also downloading from the AUR 
if [ "$EUID" -eq 0 ]; then
  echo "Error: Do not run this in root."
  echo "Run as normal user. As we are using yay"
  exit 1
fi 

PACMAN_PACKAGES=(
  "git" "nvim" "htop" "fastfetch" "qview" "figlet" "vlc" "firefox" "rofi"
)


AUR_PACKAGES=(
  
)


if [[ ${AUR_PACKAGES[@]} -gt 0 ]]; then
  # Enter sudo password for installing packman packages
  echo "Enter your sudo password: "
  sudo -v

  echo "Starting system update and pacman package installation..."

  sudo pacman -Syu --noconfirm
  sudo pacman -S --needed --noconfirm "${PACMAN_PACKAGES[@]}"

  ## Install yay if we dont have it
  if ! command -v yay &> /dev/null; then
    echo "!!! yay is not installed. Installing yay..."

    git clone https://aur.archlinux.org/yay.git /tmp/yay-build
    cd /tmp/yay-build || exit
    makepkg -si --noconfirm
    cd ~ || exit
    rm -rf /tmp/yay-build
  fi 

  echo "Installing AUR packages..."
  yay-S --needed --noconfirm "${AUR_PACKAGES[@]}"
  
else
  echo "No AUR packages specified. Skipping..."
fi

