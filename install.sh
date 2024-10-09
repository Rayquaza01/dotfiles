#!/bin/bash
if ! command -v gum &>/dev/null; then
    echo "[error] gum not available"
    echo "https://github.com/charmbracelet/gum"
    exit 1
fi

dotfiles=$(gum choose --header "Select dotfiles to install" --no-limit <dotfiles)
for dotfile in $dotfiles; do
    stow --adopt -t ~ -Sv "$dotfile"
done

if [[ "${dotfiles[*]}" =~ "vim" ]]; then
    if gum confirm "Would you like to install vim plug?"; then
        echo "Installing vim plug"
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi
fi

if [[ "${dotfiles[*]}" =~ "tmux" ]]; then
    if gum confirm "Would you like to install tmux plugin manager?"; then
        echo "Installing tmux plugin manager"
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
fi

if [[ "${dotfiles[*]}" =~ "fish" ]]; then
    if gum confirm "Would you like to install fisher?"; then
        echo "Installing fisher"
        fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
    fi

    if gum confirm "Would you like to run the fish setup script?"; then
        echo "Running fish setup"
        fish ./fish/.config/fish/fish_setup.fish
    fi
fi
