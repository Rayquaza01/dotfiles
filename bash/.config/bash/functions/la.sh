#!/usr/bin/env bash

function la() {
    if command -v eza &>/dev/null; then
        eza -la --git --icons "$@"
    elif command -v exa &>/dev/null; then
        exa -la --git --icons "$@"
    else
        command ls --color="auto" -la "$@"
    fi
}
