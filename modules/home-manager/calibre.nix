{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    programs.calibre.enable = lib.mkOption {
      description = "Ebook Library App";
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.programs.calibre.enable {
    home.packages = [
      pkgs.calibre
    ];
  };
}
