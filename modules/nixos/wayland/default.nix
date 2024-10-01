{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./general.nix
    ./login-manager.nix
    ./window-manager.nix
  ];
}
