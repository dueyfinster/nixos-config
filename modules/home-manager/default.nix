{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    #./btop.nix
    ./evince.nix
    ./git.nix
    ./shell-aliases.nix
    ./starship.nix
    ./thonny.nix
    ./wine.nix
    ./zsh.nix
    ./zoxide.nix
  ];
}
