export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export HISTFILE="${XDG_STATE_HOME}"/bash/history

export GNUPGHOME="$XDG_DATA_HOME"/gnupg

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
