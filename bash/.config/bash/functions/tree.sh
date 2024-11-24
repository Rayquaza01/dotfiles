#!/usr/bin/env bash

function tree() {
    if command -v eza &>/dev/null; then
        eza --tree --icons "$@"
    elif command -v exa &>/dev/null; then
        exa --tree --icons "$@"
    else
        command tree "$@"
    fi
}
