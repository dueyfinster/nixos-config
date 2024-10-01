{ inputs, pkgs, config, ... }:

{
    imports = [
      ./btop.nix
      ./shell-aliases.nix
      ./thonny.nix
      ./wine.nix
    ];
}
