#!/usr/bin/env bash

nix flake update\
 --flake ~/.nixos
 nixpkgs\
 stable-pkgs\
 nixos-wsl\
 nix-on-droid\
 home-manager\
 systems\
 nix-gaming\
 
