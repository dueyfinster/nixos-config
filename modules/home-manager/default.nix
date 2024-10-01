{ inputs, pkgs, config, ... }:

{
    imports = [
      ./shell-aliases.nix
      ./thonny.nix
      ./wine.nix
    ];
}
