{ pkgs, ... }: {

  xdg.mimeApps.defaultApplications = { "image/*" = [ "swayimg.desktop" ]; };

  # Custom Desktop entry because swayimg does not have one (or maybe it does have but icon is trash)
  # this is required for setting this app as default image viewer
  xdg.desktopEntries.swayimg = {
    name = "Swayimg";
    genericName = "Image Viewer";
    comment = "A simple image viewer";
    exec = "swayimg %F";
    terminal = false;
    type = "Application";
    icon =
      "${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle/scalable/apps/kuickshow.svg";
    categories = [ "Graphics" "Viewer" "Utility" ];
    startupNotify = true;
    mimeType = [
      "image/png"
      "image/jpeg"
      "image/gif"
      "image/webp"
      "image/bmp"
      "image/tiff"
      "image/svg+xml"
      "image/x-xcf"
      "image/vnd.microsoft.icon"
      "image/avif"
      "image/*"
    ];
  };

  programs.swayimg = {
    enable = true;
    settings = {
      font = {
        name = "JetBrainsMono NF";
        size = 10;
        color = "#cdd6f4ff";
        shadow = "#000000d0";
        background = "#00000000";
      };

      viewer = {
        # Window background color (auto/extend/mirror/RGBA)
        window = "#11111bcc";
        # Background for transparent images (grid/RGBA)
        transparency = "#11111bcc";
        # Default image scale (optimal/width/height/fit/fill/real/keep)
        scale = "optimal";
        # Initial image position on the window (center/top/bottom/free/...)
        position = "center";
        # Anti-aliasing mode (none/box/bilinear/bicubic/mks13)
        antialiasing = "mks13";
      };

      gallery = {
        # Height and width of each thumbnail (pixels)
        size = 200;
        # Max number of invisible thumbnails stored in memory cache
        cache = 100;
        # Load not only visible but also adjacent thumbnails
        preload = "no";
        # Enable/disable storing thumbnails in persistent storage
        pstore = "no";
        # Fill the entire tile with thumbnail
        fill = "yes";
        # Anti-aliasing mode for thumbnails (none/box/bilinear/bicubic/mks13)
        antialiasing = "mks13";
        window = "#11111bcc";
        background = "#11111bcc";
        select = "#313244cc";
        border = "#b4befeff"; # lavender
        shadow = "#b4befe00";
      };

      "info.viewer" = {
        top_left = "none";
        top_right = "none";
        bottom_left = "name";
        bottom_right = "scale";
      };

      "info.slideshow" = {
        top_left = "none";
        top_right = "none";
        bottom_left = "none";
        bottom_right = "dir,status";
      };

      "info.gallery" = {
        top_left = "none";
        top_right = "index";
        bottom_left = "none";
        bottom_right = "name,status";
      };

      # keys with comment are modified ones rest are default
      "keys.viewer" = {
        F1 = "help";
        Home = "first_file";
        End = "last_file";
        h = "step_left 10"; # changed to drag image left
        j = "step_down 10"; # added for drag image down
        k = "step_up 10"; # added for drag image up
        l = "step_right 10"; # changed to drag image right
        "Shift+h" = "prev_file"; # added vim-like previous file
        "Shift+l" = "next_file"; # added vim-like next file
        Space = "next_file";
        "Shift+r" = "rand_file";
        "Shift+d" = "prev_dir";
        d = "next_dir";
        "Shift+o" = "prev_frame";
        o = "zoom -10"; # changed from next_frame → zoom out
        i = "zoom +10"; # changed from info → zoom in
        c = "skip_file";
        s = "mode slideshow";
        n = "animation";
        f = "fullscreen";
        Return = "mode gallery";
        Left = "step_left 10";
        Right = "step_right 10";
        Up = "step_up 10";
        Down = "step_down 10";
        Equal = "zoom +10";
        Plus = "zoom +10";
        Minus = "zoom -10";
        w = "zoom width";
        "Shift+w" = "zoom height";
        z = "zoom fit";
        "Shift+z" = "zoom fill";
        "0" = "zoom optimal";
        BackSpace = "zoom optimal";
        "Alt+s" = "zoom";
        # "Alt+p" = "position";
        bracketleft = "rotate_left";
        bracketright = "rotate_right";
        m = "flip_vertical";
        "Shift+m" = "flip_horizontal";
        a = "antialiasing";
        r = "reload";
        "Shift+Delete" =
          ''exec rm -f '%' && echo "File removed: %"; skip_file'';
        Escape = "exit";
        q = "exit";
        ScrollLeft = "step_right 5";
        ScrollRight = "step_left 5";
        ScrollUp = "step_up 5";
        ScrollDown = "step_down 5";
        "Ctrl+ScrollUp" = "zoom +10 mouse";
        "Ctrl+ScrollDown" = "zoom -10 mouse";
        "Shift+ScrollUp" = "prev_file";
        "Shift+ScrollDown" = "next_file";
        "Alt+ScrollUp" = "prev_frame";
        "Alt+ScrollDown" = "next_frame";
        MouseLeft = "drag";
        MouseSide = "prev_file";
        MouseExtra = "next_file";
      };

      "keys.slideshow" = {
        F1 = "help";
        Home = "first_file";
        End = "last_file";
        h = "step_left 10"; # drag image left
        j = "step_down 10"; # drag image down
        k = "step_up 10"; # drag image up
        l = "step_right 10"; # drag image right
        "Shift+r" = "rand_file";
        "Shift+d" = "prev_dir";
        d = "next_dir";
        Space = "pause";
        i = "zoom +10"; # changed from info → zoom in
        o = "zoom -10"; # new vim-like zoom out
        f = "fullscreen";
        Return = "mode";
        Escape = "exit";
        q = "exit";
      };

      "keys.gallery" = {
        F1 = "help";
        Home = "first_file";
        End = "last_file";
        h = "step_left"; # drag image left
        j = "step_down"; # drag image down
        k = "step_up"; # drag image up
        l = "step_right"; # drag image right
        Left = "step_left";
        Right = "step_right";
        Up = "step_up";
        Down = "step_down";
        c = "skip_file";
        s = "mode slideshow";
        f = "fullscreen";
        Return = "mode viewer";
        a = "antialiasing";
        r = "reload";
        i = "mode viewer"; # changed from info → open
        o = "mode viewer";
        Equal = "thumb +20";
        Plus = "thumb +20";
        Minus = "thumb -20";
        "Shift+Delete" =
          ''exec rm -f '%' && echo "File removed: %"; skip_file'';
        Escape = "exit";
        q = "exit";
        ScrollLeft = "step_right";
        ScrollRight = "step_left";
        ScrollUp = "step_up";
        ScrollDown = "step_down";
        "Ctrl+ScrollUp" = "thumb +20";
        "Ctrl+ScrollDown" = "thumb -20";
        MouseLeft = "mode viewer";
      };
    };
  };
}
