#!/usr/bin/env bash

function vim() {
    if command -v nvim &>/dev/null; then
        nvim "$@"
    elif command -v gvim &>/dev/null; then
        gvim -v "$@"
    else
        command vim "$@"
    fi
}

function ls() {
    if command -v eza &>/dev/null; then
        eza --icons "$@"
    elif command -v exa &>/dev/null; then
        exa --icons "$@"
    else
        command ls --color="auto" "$@"
    fi
}

function ll() {
    if command -v eza &>/dev/null; then
        eza -l --git --icons "$@"
    elif command -v exa &>/dev/null; then
        exa -l --git --icons "$@"
    else
        command ls --color="auto" -l "$@"
    fi
}

function la() {
    if command -v eza &>/dev/null; then
        eza -la --git --icons "$@"
    elif command -v exa &>/dev/null; then
        exa -la --git --icons "$@"
    else
        command ls --color="auto" -la "$@"
    fi
}

function tree() {
    if command -v eza &>/dev/null; then
        eza --tree --icons "$@"
    elif command -v exa &>/dev/null; then
        exa --tree --icons "$@"
    else
        command tree "$@"
    fi
}

function cat() {
    if command -v bat &>/dev/null; then
        bat "$@"
    else
        command cat "$@"
    fi
}

function trash() {
    if command -v trash &>/dev/null; then
        command trash -- "$@"
    elif command -v gio &>/dev/null; then
        gio trash -- "$@"
    else
        # fall back to rm
        rm -I -- "$@"
    fi
}

# only apply aliases if not inside a container
if [ -z "$container" ]; then
    alias flatpak-run='flatpak run $(flatpak list --columns=application | fzf)'

    # alias ranger='. ranger ranger'
    # alias r='. ranger ranger'

    alias neofetch="fastfetch"

    alias godot="flatpak run --command=godot org.godotengine.Godot"
fi

alias open="xdg-open"
alias :q='exit'
