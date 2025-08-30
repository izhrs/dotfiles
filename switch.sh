#!/usr/bin/env bash

# my stupid script to copy the configuration files and switch.

function help() {
    cat << 'EOF'
Usage:
  switch.sh [sys|home] [--update|-u]

Arguments:
  sys       Copy and optionally update system (/etc/nixos) configuration.
  home      Copy and optionally update home-manager configuration.
  --update  Update flake before switching.
  -u        Short for --update.
  --help    Show this help message.

Examples:
  switch.sh sys --update
  switch.sh home -u
EOF
}

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

# choose diff tool (delta if available, else diff)
function diff_tool() {
    if command -v delta > /dev/null 2>&1; then
        delta "$1" "$2"
    else
        diff "$1" "$2"
    fi
}

# mkdir + touch with sudo if needed
function mkdir_or_sudo() {
    local target="$1"
    if [[ $target == /etc/* ]]; then
        sudo mkdir -p "$(dirname "$target")"
        sudo touch "$target"
    else
        mkdir -p "$(dirname "$target")"
        touch "$target"
    fi
}

# compare files from source to target
function compare_and_diff() {
    local source_dir="$1"
    local target_dir="$2"

    # using find instead of fd to maintain compatibility with systems that may not have fd installed
    # also, find ain't slow for few files, so no need to worry about performance here
    find "$source_dir" -type f | while read -r file; do
        local relpath=${file#"$source_dir"/}
        local target="$target_dir/$relpath"

        if [[ -f "$target" ]]; then
            diff_tool "$target" "$file"
        else
            mkdir_or_sudo "$target"
            diff_tool "$target" "$file"
        fi
    done
}

function main() {
    local mode="${1:-}" update_flag="${2:-}"

    # Validate first argument
    case "$mode" in
        sys)
            local source_dir="./system"
            local target_dir="/etc/nixos"
            ;;
        home)
            local source_dir="./home"
            local target_dir="$HOME/.config/home-manager"
            ;;
        --help | -h | "")
            help
            return 0
            ;;
        *)
            help
            return 1
            ;;
    esac

    # Validate second argument if provided
    if [[ -n "$update_flag" && "$update_flag" != "--update" && "$update_flag" != "-u" ]]; then
        echo "Error: Invalid second argument '$update_flag'"
        echo
        help
        return 1
    fi

    compare_and_diff "$source_dir" "$target_dir"

    if prompt "$mode"; then
        if [[ $target_dir == /etc/* ]]; then
            sudo rsync -a "$source_dir/" "$target_dir/"
        else
            rsync -a "$source_dir/" "$target_dir/"
        fi

        if [[ $update_flag == "--update" || $update_flag == "-u" ]]; then
            echo
            echo "Updating the $target_dir flake"
            echo

            if [[ $mode == "sys" ]]; then
                sudo nix flake update --flake "$target_dir"
                cp "$target_dir/flake.lock" "$source_dir/flake.lock"
                git add "$source_dir/flake.lock"
                git commit -m "system: update flakes" || true
            else
                nix flake update --flake "$target_dir"
                cp "$target_dir/flake.lock" "$source_dir/flake.lock"
                git add "$source_dir/flake.lock"
                git commit -m "home: update flakes" || true
            fi
        fi

        if [[ $mode == "sys" ]]; then
            sudo nixos-rebuild switch
        else
            home-manager switch
        fi
    fi
}

main "$@"
