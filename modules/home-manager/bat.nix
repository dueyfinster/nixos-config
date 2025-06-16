{
  config,
  pkgs,
  ...
}: {
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [batman];
    themes = {
      catpuccin = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "d2bbee4f7e7d5bac63c054e4d8eca57954b31471";
          sha256 = "sha256-x1yqPCWuoBSx/cI94eA+AWwhiSA42cLNUOFJl7qjhmw=";
        };
        file = "themes/Catppuccin Frappe.tmTheme";
      };
    };
    config = {
      paging = "never";
      theme = "catpuccin";
    };
  };

  home.shellAliases = {
    cat = "bat -p";
    man = "batman";
  };

  home.sessionVariables = {
    BAT_PAGER = "less -IFSR --mouse";
  };
}
