{pkgs, ...}: {
  imports = [
    ./c.nix
    ./deno.nix
    ./go.nix
    ./node.nix
    ./python.nix
    ./rust.nix
  ];

  home.packages = with pkgs; [
    cloudflared
    direnv
    dog
    exiftool
    flyctl
    geckodriver
    hyperfine
    jq
    mkcert
    mongodb-tools
    pscale
    railway
    redis
    tokei
    xh
  ];

  programs = {
    git = {
      enable = true;
      lfs.enable = true;
    };

    gh.enable = true;

    tealdeer.enable = true;
  };
}
