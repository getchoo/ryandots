# helix config
{
  config,
  pkgs,
  ...
}: let
  cfg = config.catppuccin;
in {
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin-${cfg.flavour}";
      editor.color-modes = true;
    };
    themes."catppuccin-${cfg.flavour}" = with builtins;
    with pkgs;
      fromTOML (readFile (fetchFromGitHub
        {
          owner = "catppuccin";
          repo = "helix";
          rev = "5677c16dc95297a804caea9161072ff174018fdd";
          sha256 = "sha256-aa8KZ7/1TXcBqaV/TYOZ8rpusOf5QeQ9i2Upnncbziw=";
        }
        + "/themes/no_italics/catppuccin_${cfg.flavour}.toml"));
  };
}
