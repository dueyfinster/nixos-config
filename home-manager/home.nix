{ config, pkgs, ... }:
{
  imports = [
	#Git
	./config/git.nix

	#Theme (cursor theme, gtk theme, ... )
	./config/theme.nix
	
	#Bash
	./config/bashrc.nix
	
	#Alacritty
	./config/alacritty.nix

	#Neovim
	./config/neovim.nix

	#Waybar
        ./config/waybar.nix

        #Yt-dlp
        ./config/yt-dlp.nix
  ];
  
  home.packages = with pkgs; [
	#Text editor
	vscodium

	#Browser
	firefox
	chromium
	qutebrowser

	#CLI program
	acpi #battery status
	pulsemixer #audio manager
	cmatrix #!!!
	imv #image viewer
	nix-prefetch-github #get hash and head from github repo

	#Color palette
	eyedropper
	
	#App launcher
	bemenu

	#File browser
	xfce.thunar
	
	#Video viewer
	haruna

	#Video editor
	shotcut

	#Image editor
	pinta
	inkscape

	#Messaging app
	signal-desktop

	#Office suite
	libreoffice

	#Font
	jetbrains-mono
        nerdfonts
	wezterm
        ];

  home.username = "ngrogan";
  home.homeDirectory = "/home/ngrogan";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
