{ config, pkgs, ... }:
{
  imports = [
	#Bat
	./config/bat.nix

	#Fzf
	./config/fzf.nix

	#Git
	./config/git.nix

	#Theme (cursor theme, gtk theme, ... )
	./config/theme.nix
	
	#Bash
	./config/bashrc.nix
	
	#Alacritty
	./config/alacritty.nix

	#Neovim
	./config/email.nix

	#Neovim
	./config/neovim.nix

	#Starship
        ./config/starship.nix

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

	discord

	#CLI program
	acpi #battery status
	pulsemixer #audio manager
	cmatrix #!!!
	imv #image viewer
  nix-prefetch-github #get hash and head from github repo
	mosh
  stow


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
	spotify
	slurp
	grim

	#Office suite
	libreoffice

        # Control Media 
	playerctl

        #Sonos Client
	noson

        #Cloud Sync
	synology-drive-client

	#Font
	jetbrains-mono
        nerdfonts
	wezterm
        ];

	nixpkgs.config.allowUnfree = true;

  home.username = "ngrogan";
  home.homeDirectory = "/home/ngrogan";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
