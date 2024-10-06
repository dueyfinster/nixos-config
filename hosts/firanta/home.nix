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
    cmatrix #!!!
    stow
  ];

  programs.zsh.enable = true;

  home.username = "ngrogan";
  home.homeDirectory = "/home/ngrogan";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
