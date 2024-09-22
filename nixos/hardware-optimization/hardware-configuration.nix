# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  # TODO: Can enable to test
  #oot.kernelParams = [
  #  "video=eDP-1:2880x1920@120"
  #  "video=DP-2:1920x1080@60"
  #];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/27f553f3-5e5a-4677-8ecb-847d364f52fd";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-a2d105fe-eba7-4709-a46e-f097c5f076ab".device = "/dev/disk/by-uuid/a2d105fe-eba7-4709-a46e-f097c5f076ab";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5715-4811";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/ea09e762-0eee-472f-90a5-a073d996c958"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
