{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  lib,
  ...
}: {
  imports = [
    # Default
    ../../modules/home-manager

    #Fish
    ../../modules/home-manager/fish.nix

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

    #Waybar
    ../../modules/home-manager/waybar.nix

    #Yt-dlp
    ../../modules/home-manager/yt-dlp.nix
  ];

  home.packages = with pkgs;
    [
      #Text editor
      #vscodium

      #Browser
      firefox
      chromium
      qutebrowser

      devenv

      discord

      #CLI program
      acpi #battery status
      pulsemixer #audio manager
      lefthook
      alejandra
      cmatrix #!!!
      imv #image viewer
      nix-prefetch-github #get hash and head from github repo
      mosh
      docker
      stow

      borgbackup
      borgmatic

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

      jq

      # Control Media
      playerctl

      #Sonos Client
      noson
      plex-desktop

      #Cloud Sync
      synology-drive-client
      tailscale

      #Font
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.noto
      jetbrains-mono
      wezterm
      whatsapp-for-linux
    ]
    ++ (with pkgs-unstable; [
      ghostty
      livebook
      obsidian
      ticktick
    ]);

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    #".config/sway/config".source = ../../modules/home-manager/sway/config;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  programs.anki.enable = true;
  programs.calibre.enable = true;
  programs.kubectl.enable = true;
  programs.drawio.enable = true;
  programs.thonny.enable = false;
  programs.wine.enable = true;

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      # Preinstall some non-trivial dependencies so emacs doesn't need to build
      # them from source
      epkgs.use-package
      epkgs.vterm
      epkgs.emacsql
    ];
  };

  services.emacs = {
    enable = true;
    client.enable = true;
    #defaultEditor = true;
    socketActivation.enable = true;
  };

  home.username = "ngrogan";
  home.homeDirectory = "/home/ngrogan";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
