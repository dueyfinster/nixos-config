{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  pkgs-unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.system;
    config.allowUnfree = true;
  };
in {
  imports = [
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../modules/nixos
  ];

  user.enable = true;
  #user.userName = "egronei";

  environment.sessionVariables = rec {
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XCURSOR_SIZE = "24";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.extraOptions = ''
    trusted-users = root ngrogan
    extra-substituters = https://devenv.cachix.org;
    extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=;
  '';

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs pkgs-unstable;};
    users = {
      "ngrogan" = import ./home.nix;
    };
  };

  environment.systemPackages = with pkgs;
    [
      vim
      neovim
      nodejs_22
      unzip
      firefox
      vscode
      steam
      bat
      eza
      wget
      freshfetch
    ]
    ++ (with pkgs-unstable; [
      hello
    ]);

  #programs.mtr.enable = true;
  #programs.gnupg.agent = {
  #  enable = true;
  #  enableSSHSupport = true;
  #};

  #services.openssh.enable = true;

  virtualisation.docker = {
    enable = true;
    # start dockerd on boot.
    # This is required for containers which are created with the `--restart=always` flag to work.
    enableOnBoot = true;
  };

  services.tailscale.enable = true;
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    systemService = true;
    user = "ngrogan";
    group = "wheel";
    dataDir = "/home/ngrogan/syncthing";
  };

  # Firmware Uodater
  services.fwupd.enable = true;

  boot.initrd.luks.devices."luks-c94a6166-2181-45a8-9af9-d28ec733337c".device = "/dev/disk/by-uuid/c94a6166-2181-45a8-9af9-d28ec733337c";
  networking.hostName = "compage"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Recommended for AMD 7040
  services.power-profiles-daemon.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
