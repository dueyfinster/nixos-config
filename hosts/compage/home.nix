{ config, pkgs, inputs, lib, ... }:
{
  imports = [
	#Bat
	../../modules/home-manager/bat.nix


  #Fish
	../../modules/home-manager/fish.nix

	#Fzf
	../../modules/home-manager/fzf.nix

	#Direnv
	../../modules/home-manager/direnv.nix

	#Git
	../../modules/home-manager/git.nix

	#Theme (cursor theme, gtk theme, ... )
	../../modules/home-manager/theme.nix
	
	#Bash
	../../modules/home-manager/bashrc.nix
	
	#Alacritty
	../../modules/home-manager/alacritty.nix

	#Neovim
	../../modules/home-manager/email.nix

	#Neovim
	../../modules/home-manager/neovim.nix

	#Starship
        ../../modules/home-manager/starship.nix

	#Waybar
	../../modules/home-manager/waybar.nix

	#Yt-dlp
	../../modules/home-manager/yt-dlp.nix

	# Zsh
	../../modules/home-manager/zsh.nix

	# Zsh
	../../modules/home-manager/zoxide.nix

  ];


  
  home.packages = with pkgs; [
	#Text editor
	vscodium

	#Browser
	firefox
	chromium
	qutebrowser

  devenv
	
	discord

	#CLI program
	acpi #battery status
	pulsemixer #audio manager
	cmatrix #!!!
	imv #image viewer
  nix-prefetch-github #get hash and head from github repo
	mosh
	docker
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
	tailscale

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
