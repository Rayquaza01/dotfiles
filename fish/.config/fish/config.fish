if status is-interactive;
    # less colors
    # based on https://unix.stackexchange.com/a/147
    set -gx LESS_TERMCAP_mb $(tput bold; tput setaf 2) # green
    set -gx LESS_TERMCAP_md $(tput bold; tput setaf 6) # cyan
    set -gx LESS_TERMCAP_me $(tput sgr0)
    set -gx LESS_TERMCAP_so $(tput bold; tput setaf 3; tput setab 8) # yellow on grey
    set -gx LESS_TERMCAP_se $(tput rmso; tput sgr0)
    set -gx LESS_TERMCAP_us $(tput smul; tput bold; tput setaf 7) # white
    set -gx LESS_TERMCAP_ue $(tput rmul; tput sgr0)
    set -gx LESS_TERMCAP_mr $(tput rev)
    set -gx LESS_TERMCAP_mh $(tput dim)
    set -gx LESS_TERMCAP_ZN $(tput ssubm)
    set -gx LESS_TERMCAP_ZV $(tput rsubm)
    set -gx LESS_TERMCAP_ZO $(tput ssupm)
    set -gx LESS_TERMCAP_ZW $(tput rsupm)
    set -gx GROFF_NO_SGR 1

    # FZF
    # https://github.com/jethrokuan/fzf
    set -gx FZF_FIND_FILE_COMMAND "fd -H"
    set -gx FZF_CD_COMMAND "fd -t d -H . $HOME"
    # ignoring the intended purpose of this
    # ALT+C is used for global cd in ~
    # ALT+SHIFT+C is for cd in pwd
    set -gx FZF_CD_WITH_HIDDEN_COMMAND "fd -t d -H"
end
