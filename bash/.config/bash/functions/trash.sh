#!/usr/bin/env bash

function trash() {
    if command -v trash &>/dev/null; then
        command trash -- "$@"
    elif command -v gio &>/dev/null; then
        gio trash -- "$@"
    else
        echo "no trash command available"
    fi
}
