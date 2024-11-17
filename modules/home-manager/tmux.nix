{
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    historyLimit = 50000;
    keyMode = "vi";
    tmuxinator.enable = true;
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = pkgs.tmuxPlugins.power-theme;
        extraConfig = ''
          set -g @tmux_power_theme 'sky'
          set -g @tmux_power_user_icon ''
          set -g @tmux_power_time_icon ''
          set -g @tmux_power_session_icon ''
        '';
      }
      better-mouse-mode
      sensible
      resurrect
      continuum
    ];
    extraConfig = ''
      # Enable true-color terminal support
      # (I think these are no longer needed since I have patched .terminfo stuff now)
      # set-option -ga terminal-overrides ",xterm-256color:Tc"  # for Konsole
      # set-option -ga terminal-overrides ",xterm-24bit:Tc"     # custom stuff
      # set-option -ga terminal-overrides ",konsole-direct:Tc"

      # Mouse support
      set-option -g mouse on

      # pane movement
      bind-key J command-prompt -p "join pane from:"  "join-pane -s ':%%'"
      #bind-key s command-prompt -p "send pane to:"  "join-pane -t ':%%'"

      # Open new windows with the same cwd as the current one
      bind-key c new-window -c '#{pane_current_path}'
      bind-key '"' split-window -c '#{pane_current_path}'
      bind-key % split-window -h -c '#{pane_current_path}'

      # don't be anal retentive about releasing ^B before hitting another key
      bind-key C-n next-window
      bind-key C-p previous-window
      bind-key C-c new-window -c '#{pane_current_path}'

      # Run tm command in tmux
      bind-key -n C-f run-shell "tmux neww tm"

      set -ga terminal-overrides ',xterm*:XT:Ms=\E]52;%p1%s;%p2%s\007'
      set -ga terminal-overrides ',screen*:XT:Ms=\E]52;%p1%s;%p2%s\007'

      # Automatic session restore.
      set -g @continuum-restore 'on'
    '';
  };
}
