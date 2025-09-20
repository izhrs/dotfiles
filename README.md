# NixOS Configuration

A NixOS configuration centered around Home Manager for declarative user environment management, with NVIDIA graphics support and essential development tools.

## Screenshots

### Helix with Yazi

![helix_with_yazi](./screenshots/helix_with_yazi.png)

### Rofi

![rofi](./screenshots/rofi.png)

<details>
  <summary>More Screenshots</summary>

### Fastfetch

![fastfetch](./screenshots/fastfetch.png)

### Zellij

![zellij](./screenshots/zellij.png)

### Firefox

![firefox](./screenshots/firefox.png)

### Helix

![helix](./screenshots/helix.png)

</details>

## Installation

### TLDR: I do not provide a magical script to transform your NixOS to mimic my config. Copy the individual program config from `home/` directory and configure/modify it according to your own liking. I do not recommend `switch.sh`, it's for my own convenience.

## Project Structure

```.
├── home/                  # Home Manager setup
│   ├── flake.nix
│   ├── home.nix
│   ├── helix/             # Helix editor config
│   ├── hypr/              # Hyprland WM config
│   ├── zellij/            # Zellij TUI multiplexer config
│   ├── yazi/              # Yazi terminal file manager config
│   └── ...                # Other Home Manager modules
├── system/                # System-level NixOS config
│   ├── configuration.nix
│   └── flake.nix
└── README.md
```

## Home Manager

This configuration includes Home Manager for declarative user environment management. Home Manager allows you to manage user-specific packages, dotfiles, and services in a reproducible way.

To set up Home Manager:

1. Install and set up `home-manager` with flakes.
2. Configure user-specific settings and packages.
3. Copy the individual `<program>` directory from `home/` directory. If you include or exclude any modules, make sure you edit `modules = [...]` in `flake.nix`.
4. Apply with: `home-manager switch`.

## Helix as IDE

This setup features deep integration of Helix with Zellij, Yazi, and Lazygit:

- **Helix**: The ~~post modern~~ _stable_ editor whose plugins don’t crash every other day because it doesn’t need 50 of them (or any) to be useful in the first place. All language configurations are managed in `home/helix/language.nix` for:
    - Rust, Nix, Lua, Python, Bash, Dockerfile, Docker Compose, JavaScript, TypeScript, JSX, TSX, JSON, YAML, Markdown, HTML, CSS, SCSS, Svelte, TOML, PowerShell
    - Most of the language is configured with formatters and language servers for a seamless development experience.
- **Yazi**: Integrated as a file picker within Helix.
- **Lazygit**: Integrated as the Git UI inside Helix.
- **Zellij**: tHe InTEgRRattion: Used to open Yazi and Lazygit in floating panes, making them appear as native Helix popups for a unified workflow.

Yazi and Lazygit are launched in context aware floating panes via Zellij, making them feel like native extensions of Helix. This tight integration allows seamless file navigation and Git operations without ever leaving the editor environment.

## Credits & Acknowledgments

This configuration is built upon the excellent work of the following projects and their maintainers:

**[NixOS](https://nixos.org/)** - The Nix Operating System that enables reproducible and declarative system configurations.

**[Home Manager](https://github.com/nix-community/home-manager)** - Nix-based user environment configurator by the nix-community, enabling declarative management of user packages and dotfiles.

**[Helix](https://helix-editor.com/)** - The ~~post modern~~ _stable_ editor whose plugins don’t crash every other day because it doesn’t need 50 of them (or any) to be useful in the first place.

**[Zellij](https://zellij.dev/)** - A terminal workspace with batteries included.

**[Yazi](https://github.com/sxyazi/yazi)** - Blazing fast terminal file manager by sxyazi, written in Rust with async I/O.

**[WezTerm](https://wezterm.org/)** – A fast, GPU-accelerated terminal emulator with vim-style key modes and a flexible Lua-based config system.

**[Catppuccin](https://github.com/catppuccin/catppuccin)** - Soothing pastel theme ecosystem maintained by the Catppuccin organization, providing consistent theming across multiple applications.

**[Starship](https://starship.rs/)** - Cross-shell prompt by the Starship contributors, providing a fast and customizable command line prompt.

**[LazyGit](https://github.com/jesseduffield/lazygit)** - Simple terminal UI for git commands by jesseduffield, providing an intuitive interface for Git operations.

**[Delta](https://github.com/dandavison/delta)** - Syntax-highlighting pager for git by dandavison, enhancing git diff output with beautiful formatting.

**[Zsh](https://www.zsh.org/)** – A fast, POSIX-compatible shell with sane scripting, proper interactivity, and plugin support that doesn’t fight you. No structured data fantasies, just a shell that gets out of the way and gets shit done.

## License

This project is licensed under MIT license

## Contributing

Feel free to open issues or submit pull requests if you have suggestions for improvements.
