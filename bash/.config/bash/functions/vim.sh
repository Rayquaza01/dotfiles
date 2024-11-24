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

