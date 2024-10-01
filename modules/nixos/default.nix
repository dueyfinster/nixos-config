{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./audio
    ./bluetooth
    ./boot
    ./locale
    ./kde-connect.nix
    ./networking
    ./printing
    ./samba
    ./ssd
    ./ssh
    ./usb
    ./user
    ./wayland
  ];
}
