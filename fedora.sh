#!/usr/bin/env bash
# script to install starship and yazi, which aren't in the default fedora repos

sudo dnf copr enable atim/starship
sudo dnf copr enable varlad/yazi

sudo dnf install starship yazi
