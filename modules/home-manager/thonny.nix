{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    programs.thonny.enable = lib.mkOption {
      description = "Simple Python IDE suitable for embedded MicroPython development.";
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.programs.thonny.enable {
    home.packages = [
      pkgs.thonny
    ];
  };
}
