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
	
	#wayland
	./wayland/general.nix
	./wayland/window-manager.nix
	./wayland/login-manager.nix
    ];

  environment.sessionVariables = rec {
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XCURSOR_SIZE = "24";
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
 
  system.stateVersion = "24.05";
}
