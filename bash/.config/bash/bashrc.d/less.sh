#!/usr/bin/env bash

export LESS_TERMCAP_mb="$(tput bold; tput setaf 2)" # green
export LESS_TERMCAP_md="$(tput bold; tput setaf 6)" # cyan
export LESS_TERMCAP_me="$(tput sgr0)"
export LESS_TERMCAP_so="$(tput bold; tput setaf 3; tput setab 8)" # yellow on grey
export LESS_TERMCAP_se="$(tput rmso; tput sgr0)"
export LESS_TERMCAP_us="$(tput smul; tput bold; tput setaf 7)" # white
export LESS_TERMCAP_ue="$(tput rmul; tput sgr0)"
export LESS_TERMCAP_mr="$(tput rev)"
export LESS_TERMCAP_mh="$(tput dim)"
export LESS_TERMCAP_ZN="$(tput ssubm)"
export LESS_TERMCAP_ZV="$(tput rsubm)"
export LESS_TERMCAP_ZO="$(tput ssupm)"
export LESS_TERMCAP_ZW="$(tput rsupm)"
export GROFF_NO_SGR=1
