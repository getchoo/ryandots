{pkgs, ...}: {
  home.packages = with pkgs; [
    ccache
    clang-tools
    glib
  ];
}
