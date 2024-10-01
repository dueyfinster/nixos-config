{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.user;
in {
  options.user = {
    enable = lib.mkEnableOption "Enable user module";
    userName = lib.mkOption {
      default = "ngrogan";
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.${cfg.userName} = {
      isNormalUser = true;
      #initialPassword = "12345";
      description = "Neil Grogan";
      extraGroups = ["networkmanager" "wheel"];
      packages = with pkgs; [];
      shell = pkgs.bash;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICKJFArleu5k2LwYiLBVmkr/6+QvFj1GwiTG8gxNoLZ6"
      ];
    };
  };
}
