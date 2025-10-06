#!/usr/bin/env bash

function activate() {
    if [ -e .venv/bin/activate ]; then
        source .venv/bin/activate
    fi
}
