#!/usr/bin/env bash

sudo nixos-rebuild switch\
 --option build-dir /var/tmp/nix-daemon
 --flake ~/.nixos#wsl;

sudo nix-collect-garbage -d;
