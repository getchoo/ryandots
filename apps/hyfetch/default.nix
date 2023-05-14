# symlink hyfetch config
{pkgs, ...}: {
  home = {
    packages = with pkgs; [hyfetch];
    file.".config/hyfetch.json".source = ./hyfetch.json;
  };
}
