# bat config
{
  config,
  pkgs,
  ...
}: let
  inherit (builtins) readFile;
  inherit (pkgs) fetchFromGitHub;
in {
  programs.bat = {
    enable = true;
    config = {
      theme = "catppuccin";
    };
    themes = {
      catppuccin = readFile (fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
          sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        }
        + "/Catppuccin-${config.catppuccin.flavour}.tmTheme");
    };
  };
}