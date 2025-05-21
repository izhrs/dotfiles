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

    for file in ./*.nix; do
      local filename=$(basename "$file")
      if [[ -f /etc/nixos/$filename ]]; then
        delta /etc/nixos/$filename $file
      else
        sudo touch /etc/nixos/$filename
        delta /etc/nixos/$filename $file
      fi
    done

    if prompt "system"; then
      sudo cp ./*.nix /etc/nixos/
      sudo nixos-rebuild switch
    fi
    ;;

  home)

    for file in .config/home-manager/*.nix; do
      local filename=$(basename "$file")
      if [[ -f ~/.config/home-manager/$filename ]]; then
        delta ~/.config/home-manager/$filename $file
      else
        touch ~/.config/home-manager/$filename
        delta ~/.config/home-manager/$filename $file
      fi
    done

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
