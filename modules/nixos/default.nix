{ inputs, pkgs, config, ... }:

{
    imports = [
      ./audio
      ./bluetooth
      ./boot
      ./locale
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