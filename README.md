# dotfiles

Personal dotfiles

## Installing

### Automatic

You can install the dotfiles using an interactive install script. Requires [`gum`](https://github.com/charmbracelet/gum).

Select the dotfiles to install, and they will be installed with stow. If installing `vim`, it will offer to install [vim-plug](https://github.com/junegunn/vim-plug). If installing `tmux`, it will offer to install [tpm](https://github.com/tmux-plugins/tpm). If installing `fish`, it will offer to install [Fisher](https://github.com/jorgebucaran/fisher).

> [!NOTE]
> The file `dotfiles` contains a list of all of the installable dotfiles.

### Manual

`stow` is used to manage the dotfiles.

To install a dotfile, run
```
stow --adopt -t ~/ -Sv <dotfile>
```

To uninstall a dotfile, run
```
stow -t ~/ -Dv <dotfile>
```

> [!NOTE]
> You can add the `-n` flag to do a dry run, to ensure it runs correctly.

## Additional Programs

The following programs are needed for the dotfiles to work correctly:

* `bat` (aliased to `cat`)
* `eza` (aliased to `ls`)
* `fd` (used with `fzf`)
* `fzf` (for fuzzy finding in vim and bash)
* `gum` (used with install script)
* `neowofetch` (from `hyfetch`, aliased to `neofetch`)
* `nodejs` (needed for coc.nvim)
* `pynvim` (needed for python based nvim plugins to work)
* `rg` (used with `fzf`)
