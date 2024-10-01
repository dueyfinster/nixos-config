{pkgs, ...}: {
  options = {
    programs.btop.enable = lib.mkOption {
      description = "Whether to install btop, check cpu, disk, ram etc.";
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.programs.btop.enable {
    programs.btop = {
      enable = true;
      settings = {
        vim_keys = true;
      };
    };
  };
}
