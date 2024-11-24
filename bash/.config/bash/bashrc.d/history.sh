#!/usr/bin/env bash

export HISTFILESIZE=10000
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
