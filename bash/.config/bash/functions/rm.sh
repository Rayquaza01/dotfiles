#!/usr/bin/env bash

function rm() {
    if command -v trash &>/dev/null; then
        trash "$@"
    else
        command rm "$@"
    fi
}
