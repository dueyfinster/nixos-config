{ inputs, pkgs, config, ... }:

{
    imports = [
      ./thonny.nix
      ./wine.nix
    ];
}
