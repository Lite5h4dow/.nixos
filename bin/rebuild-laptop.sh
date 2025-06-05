#!/usr/bin/env bash

sudo nixos-rebuild switch\
 --option build-dir /var/tmp/nix-daemon\
 --flake ~/.nixos#laptop;

# sudo nix-collect-garbage -d;
