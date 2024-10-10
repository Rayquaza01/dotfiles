# these don't inherit from bash correctly
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
