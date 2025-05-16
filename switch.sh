#!/usr/bin/env bash

# my stupid script to copy the configuration files and switch.
# suck it up niqqas, I don't care about your opinion.

function prompt() {
  local arg="$1"

  while true; do
    read -rp "Do you want to copy the $arg files and switch? (y/n): " input
    input=$(echo "$input" | tr '[:upper:]' '[:lower:]')

    case "$input" in
    y | yes) return 0 ;;
    n | no) return 1 ;;
    *) echo "Invalid input, please enter 'y' or 'n'." ;;
    esac
  done
}

function main() {
  local arg="$1"

  case "$arg" in
  sys)
    delta /etc/nixos/configuration.nix configuration.nix
    delta /etc/nixos/flake.nix flake.nix
    if prompt "system"; then
      sudo cp ./*.nix /etc/nixos/
      sudo nixos-rebuild switch
    fi
    ;;

  home)
    delta ~/.config/home-manager/home.nix .config/home-manager/home.nix
    delta ~/.config/home-manager/flake.nix .config/home-manager/flake.nix
    if prompt "home"; then
      cp .config/home-manager/*.nix ~/.config/home-manager/
      home-manager switch
    fi
    ;;

  *)
    echo "Invalid argument. Use 'sys' for system or 'home' for home."
    ;;
  esac
}

main "$1"
