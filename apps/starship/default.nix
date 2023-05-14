{
  config,
  pkgs,
  ...
}: let
  inherit (builtins) fromTOML readFile;
  inherit (pkgs) fetchFromGitHub;
in {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
    settings =
      fromTOML (readFile ./starship.toml)
      // fromTOML (readFile
        (fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "starship";
            rev = "3e3e54410c3189053f4da7a7043261361a1ed1bc";
            sha256 = "sha256-soEBVlq3ULeiZFAdQYMRFuswIIhI9bclIU8WXjxd7oY=";
          }
          + "/palettes/${config.catppuccin.flavour}.toml"));
  };
}
