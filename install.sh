#!/usr/bin/env bash
ok=0

if ! command -v dialog &>/dev/null; then
    echo "[error] dialog missing"
    ok=1
fi

if ! command -v stow &>/dev/null; then
    echo "[error] stow missing"
    ok=1
fi

if [ "$ok" -ne 0 ]; then
    exit 1
fi

if [ -z "$DIALOGRC" ]; then
    export DIALOGRC=$(realpath ./dialog/.config/dialog/.dialogrc)
fi

dotfiles=$(
    dialog \
        --separate-output \
        --stdout \
        --checklist "Select dotfiles to install" \
        0 0 0 \
        bash "" off \
        bin "" off \
        dialog "" off \
        editorconfig "" off \
        fd "" off \
        fish "" off \
        foot "" off \
        ghostty "" off \
        git "" off \
        simplevim "" off \
        tmux "" off \
        vim "" off \
        yazi "" off \
)

for dotfile in $dotfiles; do
    stow --no-folding --adopt -t ~ -Sv "$dotfile"
done

if [[ "${dotfiles[*]}" =~ "vim" ]] || [[ "${dotfiles[*]}" =~ "simplevim" ]]; then
    # if gum confirm "Would you like to install vim plug?"; then
    if dialog --yesno "Would you like to install vim plug?" 0 0; then
        echo "Installing vim plug"
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
fi

if [[ "${dotfiles[*]}" =~ "tmux" ]]; then
    if command -v git &>/dev/null; then
        if dialog --yesno "Would you like to install tmux plugin manager?" 0 0; then
            echo "Installing tmux plugin manager"
            git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        fi
    fi
fi

if [[ "${dotfiles[*]}" =~ "fish" ]]; then
    if command -v fish &>/dev/null; then
        if dialog --yesno "Would you like to install fisher?" 0 0; then
            echo "Installing fisher"
            fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
        fi

        if dialog --yesno "Would you like to run the fish setup script?" 0 0; then
            echo "Running fish setup"
            fish ./fish_setup.fish
        fi
    fi
fi

if [[ "${dotfiles[*]}" =~ "yazi" ]]; then
    if command -v ya &>/dev/null; then
        if dialog --yesno "Would you like to install yazi plugins?" 0 0; then
            echo "Installing yazi plugins"
            ya pack --install
        fi
    fi
fi

dialog --clear
