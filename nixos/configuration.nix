{ config, pkgs, ... }:
{
  imports =
    [
	#hardware optimization
	./hardware-optimization/configuration.nix

	#audio
	./audio/general.nix
	./audio/bluetooth.nix
        
	#networking
	./networking/networks.nix
	./networking/samba.nix

  #usb
	./usb/usb.nix
	
	#wayland
	./wayland/general.nix
	./wayland/window-manager.nix
	./wayland/login-manager.nix
    ];

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
 
  system.stateVersion = "24.05";
}
