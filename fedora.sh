#!/usr/bin/env bash
# Post install setup script for fedora

echo "Updating packages"
sudo dnf update -y

echo "Installing RPM Fusion"
sudo dnf install -y "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

echo "Installing homebrew"
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

echo "Adding flathub"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

if ! [[ "$PATH" =~ "/home/linuxbrew/.linuxbrew/bin" ]]; then
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

echo "Installing essential packages"
sudo dnf remove -y firefox
sudo dnf install -y bat dialog distrobox exa fastfetch fd fish fzf gnome-tweaks neovim rclone stow trash-cli vim-X11
brew install gum starship yazi
flatpak install -y com.mattjakeman.ExtensionManager com.github.tchx84.Flatseal org.mozilla.Firefox

echo "Installing nerd fonts"
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
flatpak install -y io.github.getnf.embellish
getnf -i CodeNewRoman,DejaVuSansMono

echo "Installing adw-gtk3 theme"
sudo dnf install -y adw-gtk3-theme
flatpak install -y org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3' && gsettings set org.gnome.desktop.interface color-scheme 'default'

# https://rpmfusion.org/Howto/Multimedia

echo "Setting up multimedia"

sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing

sudo dnf update -y @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

sudo dnf swap -y mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap -y mesa-vdpau-drivers mesa-vdpau-drivers-freeworld

sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y libdvdcss

if gum confirm "Install displaylink?"; then
    echo "Installing displaylink"
    sudo dnf copr enable -y crashdummy/displaylink
    sudo dnf install -y displaylink
fi

if gum confirm "Install xpadneo?"; then
    echo "Installing xpadneo"
    sudo dnf copr enable -y atim/xpadneo
    sudo dnf install -y xpadneo
fi

if gum confirm "Install OpenRazer?"; then
    sudo dnf install -y kernel-devel
    sudo dnf config-manager addrepo -y --from-repofile=https://openrazer.github.io/hardware:razer.repo
    sudo dnf install -y openrazer-meta
    flatpak install -y xyz.z3ntu.razergenie
fi

if gum confirm "Configure GNOME?"; then
    echo "Configuring GNOME"
    gsettings set org.gnome.desktop.interface clock-format '12h'
    gsettings set org.gnome.desktop.interface clock-show-weekday true
    gsettings set org.gnome.desktop.interface enable-hot-corners false
    gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
    gsettings set org.gnome.desktop.interface show-battery-percentage true
    gsettings set org.gnome.desktop.interface accent-color 'purple'

    # blur my shell settings
    # disable panel blur
    gsettings set /org/gnome/shell/extensions/blur-my-shell/panel/blur false
    # don't style overview components
    gsettings set /org/gnome/shell/extensions/blur-my-shell/overview/style-components 0

    # just perfection settings
    # always show workspace switcher
    gsettings set /org/gnome/shell/extensions/just-perfection/workspace-switcher-should-show true
    # hide window picker caption
    gsettings set /org/gnome/shell/extensions/just-perfection/window-preview-caption false
    # starup to desktop, not overview
    gsettings set /org/gnome/shell/extensions/just-perfection/startup-status 0
fi
