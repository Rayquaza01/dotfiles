#!/usr/bin/env bash
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/dialog/.dialogrc ]; then
    export DIALOGRC="${XDG_CONFIG_HOME:-$HOME/.config}"/dialog/.dialogrc
fi
