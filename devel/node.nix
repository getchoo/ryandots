{pkgs, ...}: {
  home.packages = with pkgs; [
    fnm
    nodePackages.pnpm
    yarn
  ];
}
