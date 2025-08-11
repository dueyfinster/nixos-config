{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    ../../modules/home-manager
  ];

  home.packages = with pkgs; [
    stow
  ];

  programs.zsh.enable = true;

  home.username = "ngrogan";
  home.homeDirectory = "/home/ngrogan";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
