# FZF
# https://github.com/jethrokuan/fzf
set -gx FZF_FIND_FILE_COMMAND "fd -H"
set -gx FZF_CD_COMMAND "fd -t d -H . $HOME"
# ignoring the intended purpose of this
# ALT+C is used for global cd in ~
# ALT+SHIFT+C is for cd in pwd
set -gx FZF_CD_WITH_HIDDEN_COMMAND "fd -t d -H"
