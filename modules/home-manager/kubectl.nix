{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    programs.kubectl.enable = lib.mkOption {
      description = "Kubernetes command line";
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config.programs.kubectl.enable {
    home.packages = [
      pkgs.kubectl
      pkgs.kubectx
      pkgs.kubecolor
      pkgs.kustomize
    ];

    home.shellAliases = {
      k = "kubectl";
      kd = "kubectl describe";
      ka = "kubectl apply -f";
      kns = "kubens";
    };
  };
}
