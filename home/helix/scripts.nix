{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # got this script from: https://yazi-rs.github.io/docs/tips/#helix-with-zellij
    # fix applied from https://github.com/sxyazi/yazi/issues/3046
    (writeShellScriptBin "yazi-picker" ''
      paths=$(echo $(yazi "$2" --chooser-file=/dev/stdout) | while read -r; do printf "%q " "$REPLY"; done)

      if [[ -n "$paths" ]]; then
      	zellij action toggle-floating-panes
      	zellij action write 27 # send <Escape> key
      	zellij action write-chars ":$1 $paths"
      	zellij action write 13 # send <Enter> key
      	zellij action write 27 # send <Escape> key
      else
      	zellij action toggle-floating-panes
      fi
    '')
  ];
}
