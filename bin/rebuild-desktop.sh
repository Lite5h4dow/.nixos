#!/usr/bin/env bash

sudo nixos-rebuild switch\
 --option build-dir /var/tmp/nix-daemon\
 --flake ~/.nix#desktop;

sudo nix-collect-garbage -d;
