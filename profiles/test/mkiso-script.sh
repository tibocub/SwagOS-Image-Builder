#!/bin/sh
#
#  Build SwagOS ISO - generates Swag_OS.iso using Void image building tools:
#  https://github.com/void-linux/void-mklive
#

sudo ./mkiso.sh \
	-a x86_64 \
	-b base \
	-- \
	-p "neovim htop git xterm fzf bat exa jwm ncdu pcmanfm xarchiver" \
	-k "fr" \
	-i "lz4" \
	-l "en_US.UTF-8" \
	-T "\$wag_OS" \
	-o Swag_OS-x86_64-glibc.iso
