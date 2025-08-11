{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.ngrogan = {
    name = "ngrogan";
    home = "/home/ngrogan";
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "ngrogan" = import ./home.nix;
    };
  };
}
