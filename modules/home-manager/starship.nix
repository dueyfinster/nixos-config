{config, pkgs, ...}:
{
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      #settings = pkgs.lib.importTOML ./starship.toml;
    };
}
