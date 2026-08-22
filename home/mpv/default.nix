{
  programs.mpv = {
    enable = true;
    config = {
      gpu-api = "opengl";
      hwdec = "vaapi";

      # yt-dlp
      ytdl-format = "bestvideo+bestaudio";
      ytdl-raw-options = "sub-lang=en,write-auto-sub=";

      # Playback quality-of-life
      save-position-on-quit = true;
      keep-open = true; # don't auto-close/advance-quit after last file
    };
  };
}
