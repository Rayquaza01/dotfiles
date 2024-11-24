#!/usr/bin/env bash

function ll() {
    if command -v eza &>/dev/null; then
        eza -l --git --icons "$@"
    elif command -v exa &>/dev/null; then
        exa -l --git --icons "$@"
    else
        command ls --color="auto" -l "$@"
    fi
}
