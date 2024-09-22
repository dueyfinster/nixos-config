{config, pkgs, ...}:
{
  home.shellAliases = {
    z = "zoxide query -i";
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

}
