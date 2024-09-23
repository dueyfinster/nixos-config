{ config, pkgs, inputs, lib, ... }:
{
  imports =
    [
      inputs.home-manager.nixosModules.default
	#hardware optimization
	../../modules/nixos/hardware-optimization/configuration.nix

	#audio
	../../modules/nixos/audio/general.nix
	../../modules/nixos/audio/bluetooth.nix
        
	#networking
	../../modules/nixos/networking/networks.nix
	../../modules/nixos/networking/samba.nix

  ../../modules/nixos/user.nix

  #usb
	../../modules/nixos/usb/usb.nix
	
	#wayland
	../../modules/nixos/wayland/general.nix
	../../modules/nixos/wayland/window-manager.nix
	../../modules/nixos/wayland/login-manager.nix
    ];


  user.enable = true;
  #user.userName = "egronei";

  environment.sessionVariables = rec {
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XCURSOR_SIZE = "24";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  nix.extraOptions = ''
      trusted-users = root ngrogan
      extra-substituters = https://devenv.cachix.org;
      extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=;
  '';

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "ngrogan" = import ./home.nix;
    };   
   };
  
  environment.systemPackages = with pkgs; [
    vim
    neovim
    firefox
    steam
    bat
    eza
    wget
    tmux
    freshfetch
   ];
  
  #programs.mtr.enable = true;
  #programs.gnupg.agent = {
  #  enable = true;
  #  enableSSHSupport = true;
  #};

  #services.openssh.enable = true;
  services.printing.enable = true;    
    services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  virtualisation.docker = {
    enable = true;
    # start dockerd on boot.
    # This is required for containers which are created with the `--restart=always` flag to work.
    enableOnBoot = true;
  };

  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "prohibit-password"; # disable root login with password
      PasswordAuthentication = false; # disable password login
    };
    openFirewall = true;
  };

  services.tailscale.enable = true;
 
  system.stateVersion = "24.05";
}
