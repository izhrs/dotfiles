<h1 align="center"> Dotfiles </h1>

<p align="center">
<!-- NixOS (Blue) -->
<img src="https://img.shields.io/badge/NixOS-94e2d5?logo=nixos&logoColor=1e1e2e" />

<!-- Home Manager (Sky) -->
<img src="https://img.shields.io/badge/Home%20Manager-f5c2e7?logo=nixos&logoColor=1e1e2e" />

<!-- Cosmic DE (Lavender) -->
<img src="https://img.shields.io/badge/COSMIC-b4befe?logo=system76&logoColor=1e1e2e" />

<!-- Helix (Mauve) -->
<img src="https://img.shields.io/badge/Helix-cba6f7?logo=helix&logoColor=1e1e2e" />

<!-- Yazi (Blue) -->
<img src="https://img.shields.io/badge/Yazi-74c7ec?logo=fireship&logoColor=1e1e2e" />

<!-- Yazi (Pink) -->
<img src="https://img.shields.io/badge/Starship-f5c2e7?logo=starship&logoColor=1e1e2e" />
</p>

<p align="center"> Welcome to my Nix Dotfiles, a configuration using Home Manager, featuring the COSMIC desktop, Catppuccin theme, and essential development tools. </p>

## Screenshots

### Cosmic DE

![cosmic_de](./screenshots/cosmic.png)

### Fastfetch

![fastfetch](./screenshots/fastfetch.png)

<details>
  <summary>More Screenshots</summary>

### Zellij

![zellij](./screenshots/zellij.png)

### Helix with Yazi

![helix_with_yazi](./screenshots/helix_with_yazi.png)

### Helix with Lazygit

![helix_with_lazygit](./screenshots/helix_with_lazygit.png)

### Helix

![helix](./screenshots/helix.png)

### Helix with Gemini

![helix_with_gemini](./screenshots/helix_with_gemini.png)

### Tiles

![titles](./screenshots/tiles.png)

### Bottom

![bottom](./screenshots/bottom.png)

### Cosmic Files and Nautilus

![cosmic_files_and_nautilus](./screenshots/cosmic_files_and_nautilus.png)

### Firefox

![firefox](./screenshots/firefox.png)

### Firefox with vertical tabs

![firefox_with_vertical_tabs](./screenshots/firefox_vert_tab.png)

### Nwg-drawer

![nwg-drawer](./screenshots/nwg_drawer.png)

### Rofi

![rofi](./screenshots/rofi.png)

### Swayimg

![swayimg](./screenshots/swayimg.png)

### Swayimg Gallery

![swayimg_gallery](./screenshots/swayimg_gallery.png)

</details>

## Project Structure

> [!note]
> This configuration is built for my personal use. I don't intend for others to use it as-is, and making it portable or beginner-friendly is not a goal of this dotfiles. There is no setup script. Some may even call it incomplete as it does not even have proper system wide light theme configured (I only use dark mode).
> That said, the code is structured so that individual program configurations are easy to lift out. Each program lives in its own directory and is self-contained, it only relies on flake inputs, not on shared variables or a centralized theme layer. If you want to borrow the Firefox config, for example, copying `home/firefox/` and adding the relevant flake input (e.g. NUR) to your own `flake.nix` is all you need.
> This is intentional. Unlike dotfile setups where every program imports a shared base config full of theme variables and reused abstractions, each module here can be read and understood in isolation. The use of Home Manager as a NixOS module is purely for integration convenience, not as a framework that everything else is built on top of.

```.
├── home/
│   ├── default.nix        # User environment vars, xdg default appliations and module inports
│   ├── cosmic/            # Cosmic DE config (not nixified)
│   ├── helix/             # Helix editor config
│   ├── yazi/              # Yazi terminal file manager config
│   ├── zellij/            # Zellij TUI multiplexer config
│   └── ...                # Other Home Manager modules
├── system/                # System-level NixOS config
│   ├── configuration.nix
│   ├── desktop.nix
│   ├── virtualisation.nix
│   └── ...
├── flake.nix              # all flake inputs and home-manager config
├── README.md
└── ...
```

## Home Manager

This configuration uses Home Manager as a Nix module (instead of running a standalone home-manager CLI setup). Home Manager declaratively manages the user environment: packages, dotfiles, and user services in a reproducible way.

## Helix as IDE

This setup features deep integration of Helix with Zellij, Yazi, and Lazygit:

- **Helix**: The ~~post modern~~ _stable_ editor whose plugins don’t crash every other day because it doesn’t need 50 of them (or any) to be useful in the first place. All language configurations are managed in `home/helix/language.nix` for:
    - Rust, C, C++, Nix, Lua, Typst, Python, Bash, Dockerfile, Docker Compose, JavaScript, TypeScript, JSX, TSX, JSON, YAML, Markdown, HTML, CSS, SCSS, Svelte, TOML, PowerShell
    - Most of the language is configured with formatters and language servers.
- **Yazi**: Integrated as a file picker within Helix.
- **Lazygit**: Integrated as the Git UI inside Helix.
- **Zellij**: tHe InTEgRRattion: Used to open Yazi and Lazygit in floating panes, making them appear as native Helix popups for a unified workflow.
- **LLM Integration**: Gemini is integrated for AI-assisted tasks, available through floating Zellij panes. Note that this can be configured to work with any cli tool. Just edit the scripts in `./home/helix/default.nix`.

> [!note]
> There's no LLM based autocompletion setup. I dislike those tools, and this Gemini is mostly for generatin commit messages and README files. If you want copilot like completion, look for `helix-gpt`.

Keybindings for LLM features:

- `space + l + a`: Analyze the code and suggest improvements.
- `space + l + c`: Open a chat session with Gemini.
- `space + l + e`: Explain the selected codebase.
- `space + l + m`: Generate a commit message based on the current changes.

Yazi and Lazygit are launched in context aware floating panes via Zellij, making them feel like native extensions of Helix. This tight integration allows seamless file navigation and Git operations without ever leaving the editor environment.

## Credits & Acknowledgments

This configuration is built upon the excellent work of the following projects and their maintainers:

**[NixOS](https://nixos.org/)** - The Nix Operating System that enables reproducible and declarative system configurations.

**[Cosmic DE](https://system76.com/cosmic)** - Customizable, and performant desktop environment built from scratch using Rust and the Iced toolkit.

**[Home Manager](https://github.com/nix-community/home-manager)** - Nix-based user environment configurator by the nix-community, enabling declarative management of user packages and dotfiles.

**[Helix](https://helix-editor.com/)** - The ~~post modern~~ _stable_ editor whose plugins don’t crash every other day because it doesn’t need 50 of them (or any) to be useful in the first place.

**[Zellij](https://zellij.dev/)** - A terminal workspace with batteries included.

**[Yazi](https://github.com/sxyazi/yazi)** - Blazing fast terminal file manager by sxyazi, written in Rust with async I/O.

**[Kitty](https://github.com/kovidgoyal/kitty)** - A fast, feature-rich, GPU-based terminal emulator.

**[Rofi](https://github.com/davatorium/rofi)** - An application launcher and dmenu replacement.

**[Nwg-drawer](https://github.com/nwg-piotr/nwg-drawer)** - A GTK3-based application drawer for wlroots-based Wayland compositors. However this works in my smithay based COSMIC de rather well.

**[Catppuccin](https://github.com/catppuccin/catppuccin)** - Soothing pastel theme ecosystem maintained by the Catppuccin organization, providing consistent theming across multiple applications.

**[Starship](https://starship.rs/)** - Cross-shell prompt by the Starship contributors, providing a fast and customizable command line prompt.

**[LazyGit](https://github.com/jesseduffield/lazygit)** - Simple terminal UI for git commands by jesseduffield, providing an intuitive interface for Git operations.

**[Delta](https://github.com/dandavison/delta)** - Syntax-highlighting pager for git by dandavison, enhancing git diff output with beautiful formatting.

**[Zsh](https://www.zsh.org/)** – A fast, POSIX-compatible shell with sane scripting, proper interactivity, and plugin support that doesn’t fight you. No structured data fantasies, just a shell that gets out of the way and gets shit done.

## License

This project is licensed under MIT license

## Contributing

Feel free to open issues or submit pull requests if you have suggestions for improvements.
