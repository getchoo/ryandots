_: {
  programs.zsh = {
    enable = true;

    initExtra = ''
      test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"
      eval "$(fnm env --use-on-cd)"
      eval "$(/opt/homebrew/bin/brew shellenv)"eval "$(pyenv init -)"
      source "$HOME/.cargo/env"
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "macos"
        "git"
        "brew"
        "yarn"
        "direnv"
        "1password"
        "zsh-syntax-highlighting"
        "zsh-autosuggestions"
      ];
    };

    sessionVariables = {
      ZSH_THEME = "robbyrussel";
      DISABLE_AUTO_TITLE = "true";
      DISABLE_MAGIC_FUNCTIONS = "true";
      LANG = "en_US.UTF-8";
      EDITOR = "hx";
    };

    shellAliases = {
      ghrvw = "gh repo view --web";
      opr = "op run --env-file=.env.1password --";
      dequarantine = "xattr -d com.apple.quarantine";
      pip-upgrade-all = "pip --disable-pip-version-check list --outdated --format=json | python -c \"import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))\" | xargs -n1 pip install -U";
    };
  };
}
