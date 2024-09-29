{ inputs, pkgs, config, ... }:

{
  imports = [
	#Bat
	../../modules/home-manager/bat.nix
  ];

    # TODO
  home.username = "ngrogan";
  home.homeDirectory = "/home/ngrogan";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
