# large list of packages
{pkgs, ...}: {
  imports = [
    ./bat.nix
    ./catppuccin.nix
    ./exa.nix
    ./firefox.nix
    ./fnm.nix
    ./fzf.nix
    ./helix.nix
    ./hyfetch
    ./neofetch
    ./silicon
    ./starship
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    _1password
    _1password-gui
    # blackhole-16ch
    gdbm
    asciinema
    fd
    ffmpeg
    glib
    inkscape
    spicetify-cli
    # sf-symbols
    # slim hud
    ttfautohint
  ];
}
