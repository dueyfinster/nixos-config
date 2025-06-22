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
        plugin = pkgs.tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "frappe"
          set -g @catppuccin_window_status_style "rounded"
          set -g @catppuccin_window_left_separator ""
          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_middle_separator " █"
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
          set -g @catppuccin_status_modules_right "directory date_time"
          set -g @catppuccin_status_modules_left "session"
          set -g @catppuccin_status_left_separator  " "
          set -g @catppuccin_status_right_separator " "
          set -g @catppuccin_status_right_separator_inverse "no"
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_connect_separator "no"
          set -g @catppuccin_directory_text "#{b:pane_current_path}"
          set -g @catppuccin_date_time_text "%H:%M"

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


      set -g status-position top
      set -g pane-active-border-style 'fg=magenta,bg=default'
      set -g pane-border-style 'fg=brightblack,bg=default'

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
