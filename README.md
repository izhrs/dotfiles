
# NixOS Configuration

A personal NixOS configuration featuring a modern development environment with GNOME desktop, NVIDIA graphics support, and virtualization capabilities.
## Screenshots

coming soon

## Installation

### TLDR: I do not provide magical script to transform you nix to mimic my config. Copy the individual program config from `home-manger` directory and configure/modify it according to your own liking. I do not recommend `switch.sh`, it's for my own convenience.

1. Clone this repository
2. Copy `hardware-configuration.nix` from your system
3. Update user configuration in `configuration.nix`
4. Apply configuration:
   ```bash
   sudo nixos-rebuild switch --flake .#nixos
   ```

## Project Structure

```
.
├── configuration.nix       # Main system configuration goes in /etc/nixos
├── flake.nix               # Nix flake configuration
└── .config                 # User specific config goes in /home/<user>/
   ├── home-manager         # home manager configs
   └── nvim                 # home-manager independent lazyvim config
```

## Home Manager

This configuration includes home-manager for declarative user environment management. Home-manager allows you to manage user-specific packages, dotfiles, and services in a reproducible way.

To set up home-manager:
1. Create a `home.nix` configuration file or run `home-manager init`
2. Configure user-specific settings and packages
3. Copy the `*.nix` from `.config/home-manager/` directory. If you include or exclude any modules, make sure you edit `modules = [...]` in `flake.nix`
4. Apply with: `home-manager switch`

## Credits & Acknowledgments

This configuration is built upon the excellent work of the following projects and their maintainers:

**[NixOS](https://nixos.org/)** - The Nix Operating System that enables reproducible and declarative system configurations.

**[Home Manager](https://github.com/nix-community/home-manager)** - Nix-based user environment configurator by the nix-community, enabling declarative management of user packages and dotfiles.

**[LazyVim](https://www.lazyvim.org)** - Neovim configuration framework by folke that provides a modern, extensible, and lazy-loading setup for Neovim.

**[Catppuccin](https://github.com/catppuccin/catppuccin)** - Soothing pastel theme ecosystem maintained by the Catppuccin organization, providing consistent theming across multiple applications.

**[spicetify-nix](https://github.com/Gerg-L/spicetify-nix)** - Nix flake for Spicetify CLI by Greg-L, enabling declarative Spotify customization through Home Manager integration.

**[Starship](https://starship.rs/)** - Cross-shell prompt by the Starship contributors, providing a fast and customizable command line prompt.

**[Kitty](https://sw.kovidgoyal.net/kitty/)** - Fast, feature-rich, GPU-accelerated terminal emulator by Kovid Goyal.

**[Yazi](https://github.com/sxyazi/yazi)** - Blazing fast terminal file manager by sxyazi, written in Rust with async I/O.

**[LazyGit](https://github.com/jesseduffield/lazygit)** - Simple terminal UI for git commands by jesseduffield, providing an intuitive interface for Git operations.

**[Delta](https://github.com/dandavison/delta)** - Syntax-highlighting pager for git by dandavison, enhancing git diff output with beautiful formatting.

**[Nushell](https://www.nushell.sh/)** - Modern shell written in Rust by the Nushell contributors, featuring structured data pipelines and powerful scripting capabilities.

## License

This project is licensed under MIT license

## Contributing

Feel free to open issues or submit pull requests if you have suggestions for improvements.
