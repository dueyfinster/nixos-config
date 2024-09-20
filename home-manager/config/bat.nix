{config, pkgs, ...}:
{
    programs.bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batman ];
    };

    home.shellAliases = {
      cat = "bat -p";
      man = "batman";
    };

    home.sessionVariables = {
      BAT_PAGER = "less -IFSR --mouse";
    };
}
