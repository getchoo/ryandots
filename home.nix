_: {
  imports = [
    ./apps
    ./devel
    ./shells
  ];

  home = {
    username = "ryan";
    homeDirectory = "/Users/ryan";
    stateVersion = "23.05";
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
