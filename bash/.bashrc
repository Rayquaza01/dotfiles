# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific configuration and variables
if [ -d ~/.config/bash/bashrc.d ]; then
        for rc in ~/.config/bash/bashrc.d/*.sh; do
                if [ -f "$rc" ]; then
                        . "$rc"
                fi
        done
fi

# user specific functions and aliases
# only load if interactive
if [[ $- == *i* ]]; then
    if [ -d ~/.config/bash/functions ]; then
            for rc in ~/.config/bash/functions/*.sh; do
                    if [ -f "$rc" ]; then
                            . "$rc"
                    fi
            done
    fi
fi

unset rc
