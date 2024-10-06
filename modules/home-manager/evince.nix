{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    programs.evince.enable = lib.mkOption {
      description = "Whether to install evince pdf reader";
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.programs.evince.enable {
    programs.evince = {
      enable = true;
    };
  };
}
