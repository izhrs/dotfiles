#!/usr/bin/env bash

# my stupid script to copy the configuration files and switch.
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

            # using find instead of fd to maintain compatibility with systems that may not have fd installed
            # also, find ain't slow for few files, so no need to worry about performance here
            find ./system -name '*.nix' -type f | while read -r file; do
                local relpath=${file#./system/}
                local target="/etc/nixos/$relpath"
                if [[ -f "$target" ]]; then
                    if command -v delta > /dev/null 2>&1; then
                        delta "$target" "$file"
                    else
                        diff "$target" "$file"
                    fi
                else
                    sudo mkdir -p "$(dirname "$target")"
                    sudo touch "$target"
                    if command -v delta > /dev/null 2>&1; then
                        delta "$target" "$file"
                    else
                        diff "$target" "$file"
                    fi
                fi
            done

            if prompt "system"; then
                sudo rsync -a ./system/ /etc/nixos/
                sudo nixos-rebuild switch
            fi
            ;;

        home)

            find ./home -type f | while read -r file; do
                local relpath=${file#./home/}
                local target="$HOME/.config/home-manager/$relpath"
                if [[ -f "$target" ]]; then
                    if command -v delta > /dev/null 2>&1; then
                        delta "$target" "$file"
                    else
                        diff "$target" "$file"
                    fi
                else
                    mkdir -p "$(dirname "$target")"
                    touch "$target"
                    if command -v delta > /dev/null 2>&1; then
                        delta "$target" "$file"
                    else
                        diff "$target" "$file"
                    fi
                fi
            done

            if prompt "home"; then
                rsync -a ./home/ ~/.config/home-manager/
                home-manager switch
            fi
            ;;

        *)
            echo "Invalid argument. Use 'sys' for system or 'home' for home."
            ;;
    esac
}

main "$1"
