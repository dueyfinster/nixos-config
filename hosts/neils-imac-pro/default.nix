{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.default
    ../../modules/darwin
  ];

  users.users.ngrogan = {
    name = "ngrogan";
    home = "/Users/ngrogan";
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "ngrogan" = import ./home.nix;
    };
  };

  homebrew = {
    casks = [
      label-live
    ];
    masApps = {
      #"Microsoft Excel"       = 462058435;
      #"Microsoft PowerPoint"  = 462062816;
      #"Microsoft Word"        = 462054704;
    };
  };
}
