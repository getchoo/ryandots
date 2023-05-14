# sets option for shells globally
_: let
  mkPath = paths: (builtins.concatStringsSep ":" paths) + "$PATH";
  addToPath = [
    "$(yarn global bin)"
    "$HOME/.local/bin"
    "$HOME/.deno/bin"
    "$PNPM_HOME"
    "$HOME/go/bin"
  ];
in {
  imports = [
    ./zsh.nix
  ];

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
    PNPM_HOME = "$HOME/Library/pnpm";
    NEXT_TELEMETRY_DISABLED = "1";
    CHECKPOINT_DISABLE = "1";
    DISABLE_TELEMETRY = "YES";
    GOPROXY = "direct";
    PATH = mkPath addToPath;
  };
}
