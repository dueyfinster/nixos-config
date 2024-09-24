{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.default
    ../../modules/darwin
  ];

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