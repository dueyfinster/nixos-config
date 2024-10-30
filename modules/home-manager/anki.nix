{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    programs.anki.enable = lib.mkOption {
      description = "Flashcard app";
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.programs.anki.enable {
    home.packages = [
      pkgs.anki
    ];
  };
}
