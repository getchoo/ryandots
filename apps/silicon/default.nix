# symlink silicon config
{pkgs, ...}: {
  home = {
    packages = with pkgs; [silicon];
    file.".config/silicon/config".source = ./config;
  };
}
