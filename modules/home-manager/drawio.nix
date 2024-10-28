{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    programs.drawio.enable = lib.mkOption {
      description = "Simple drawing app";
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.programs.drawio.enable {
    home.packages = [
      pkgs.drawio
    ];
  };
}
