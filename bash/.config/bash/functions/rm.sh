#!/usr/bin/env bash

function rm() {
    if command -v trash &>/dev/null; then
        command trash $@
    else
        command rm $@
    fi
}
