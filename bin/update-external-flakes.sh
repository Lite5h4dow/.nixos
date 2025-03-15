#!/usr/bin/env bash

cd ~/.nixos;

nix flake update\
 wrapper-manager\
 flake-utils\
 flake-compat\
 flake-parts\
 astal\
 ags\
 jerry\
 curd\
 lobster\
 stylix\
 zen-browser\
 nixcord\

cd -;
