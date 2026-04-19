#!/bin/sh

packages=$(xbps-query -m)
locale=$(locale | head -n 1)
shell=$(which $SHELL)


