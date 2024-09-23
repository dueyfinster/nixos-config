{ config, pkgs, inputs, lib, ... }:
{
  imports =
    [
      inputs.home-manager.nixosModules.default
	#hardware optimization
	../../lib/nixos/hardware-optimization/configuration.nix

	#audio
	../../lib/nixos/audio/general.nix
	../../lib/nixos/audio/bluetooth.nix
        
	#networking
	../../lib/nixos/networking/networks.nix
	../../lib/nixos/networking/samba.nix

  ../../lib/nixos/user.nix

  #usb
	../../lib/nixos/usb/usb.nix
	
	#wayland
	../../lib/nixos/wayland/general.nix
	../../lib/nixos/wayland/window-manager.nix
	../../lib/nixos/wayland/login-manager.nix
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
