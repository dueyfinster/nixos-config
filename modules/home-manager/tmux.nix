{
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    historyLimit = 50000;
    baseIndex = 1;
    shortcut = "a";
    keyMode = "vi";
    tmuxinator.enable = true;
    mouse = true;

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
      continuum
      resurrect
      sensible
      vim-tmux-navigator
      yank
    ];
    extraConfig = ''
      # Set zsh to the default-shell
      # set-option -g default-shell zsh # unsure if this is needed for non-macos
      # Needed for macOS
      set-option -g default-command zsh

      # Enable true-color terminal support
      # (I think these are no longer needed since I have patched .terminfo stuff now)
      set-option -ga terminal-overrides ",xterm-256color:Tc"  # for Konsole
      set-option -ga terminal-overrides ",xterm-24bit:Tc"     # custom stuff
      set-option -ga terminal-overrides ",konsole-direct:Tc"

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
      bind-key -r f run-shell "tmux neww ~/.local/bin/tm"
      bind-key -r D run-shell "~/.local/bin/tm ~/.dotfiles"

      # Automatic session restore.
      set -g @continuum-restore 'on'
    '';
  };
}
