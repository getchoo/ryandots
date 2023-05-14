{pkgs, ...}: {
  home.packages = with pkgs; [
    python310
    python310Packages.mysqlclient
  ];
}
