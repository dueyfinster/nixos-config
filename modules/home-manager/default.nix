{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    #./btop.nix
    ./evince.nix
    ./shell-aliases.nix
    ./thonny.nix
    ./wine.nix
    ./zsh.nix
  ];
}
