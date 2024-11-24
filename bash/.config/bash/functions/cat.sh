#!/usr/bin/env bash

function cat() {
    if command -v bat &>/dev/null; then
        bat "$@"
    else
        command cat "$@"
    fi
}
