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

   homebrew = {
    casks = [
      "eclipse-jee"
      "elgato-stream-deck"
      "font-fira-code-nerd-font"
      "font-hack-nerd-font"
      "font-intel-one-mono"
      "font-jetbrains-mono"
      "font-jetbrains-mono-nerd-font"
      "font-nunito-sans"
      "intellij-idea-ce"
      "keyboard-maestro"
      "obsidian"
      "temurin"
    ];
     masApps = {
      #"Microsoft Excel"       = 462058435;
      #"Microsoft PowerPoint"  = 462062816;
      #"Microsoft Word"        = 462054704;
    };
  };
}