#!/usr/bin/env bash

function ls() {
    if command -v eza &>/dev/null; then
        eza --icons "$@"
    elif command -v exa &>/dev/null; then
        exa --icons "$@"
    else
        command ls --color="auto" "$@"
    fi
}
