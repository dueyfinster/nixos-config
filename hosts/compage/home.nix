{ config, pkgs, inputs, lib, ... }:
{
  imports = [
	#Bat
	../../lib/home-manager/bat.nix


  #Fish
	../../lib/home-manager/fish.nix

	#Fzf
	../../lib/home-manager/fzf.nix

	#Direnv
	../../lib/home-manager/direnv.nix

	#Git
	../../lib/home-manager/git.nix

	#Theme (cursor theme, gtk theme, ... )
	../../lib/home-manager/theme.nix
	
	#Bash
	../../lib/home-manager/bashrc.nix
	
	#Alacritty
	../../lib/home-manager/alacritty.nix

	#Neovim
	../../lib/home-manager/email.nix

	#Neovim
	../../lib/home-manager/neovim.nix

	#Starship
        ../../lib/home-manager/starship.nix

	#Waybar
	../../lib/home-manager/waybar.nix

	#Yt-dlp
	../../lib/home-manager/yt-dlp.nix

	# Zsh
	../../lib/home-manager/zsh.nix

	# Zsh
	../../lib/home-manager/zoxide.nix

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
