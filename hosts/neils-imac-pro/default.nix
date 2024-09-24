{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.default
    ../../modules/darwin
  ];

  users.users.ngrogan = {
    name = "ngrogan";
    home = "/Users/ngrogan";
  };
  
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "ngrogan" = import ./home.nix;
    };   
   };
}