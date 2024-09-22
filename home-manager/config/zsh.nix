{config, pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    # enable completion
    enableCompletion = true;
    completionInit = "autoload -U compinit && compinit -i";
    autosuggestion.enable = true;
  };
}
