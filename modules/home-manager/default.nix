{ inputs, pkgs, config, ... }:

{
    imports = [
      ./btop.nix
      ./thonny.nix
      ./wine.nix
    ];
}
