{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    # enable completion
    enableCompletion = true;
    completionInit = "autoload -U compinit && compinit -i";
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      # CTRL+F bound to find tmux session
      bindkey -s ^f "tm\n"
    '';

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
