# global catppuccin settings
{lib, ...}: {
  options.catppuccin = with lib; {
    flavour = mkOption {
      type = types.enum ["latte" "frappe" "macchiato" "mocha"];
      default = "latte";
      description = "Global Catppuccin flavour";
    };
  };

  config.catppuccin = {
    flavour = "macchiato";
  };
}
