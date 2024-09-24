{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.default
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  services.nix-daemon.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  users.users.egronei = {
    name = "egronei";
    home = "/Users/egronei";
  };
  
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "egronei" = import ./home.nix;
    };   
   };
}