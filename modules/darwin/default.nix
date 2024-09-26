{ pkgs, lib, inputs, config, username, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
        # common Darwin packages
        fd
        bat
        eza
        neovim
      ] ++ (if system == "aarch64-darwin" then [
        # ARM-only packages

      ] else [
        # Intel-only packages
        # Darwin packages for Intel-only
        gdb
        ghidra-bin
      ]);

       homebrew = {
        enable = true;
        global = {
          autoUpdate = false;
        };
        onActivation = {
          autoUpdate = false;
          # cleanup = "uninstall";
          extraFlags = [
            "--verbose"
          ];
        };
        brews = [
          "pidof"
          "pcalc"
        ];
        casks = [
          "anki"
          #"bartender"
          "bunch"
          "drawio"
          "docker"
          "emacs"
          "firefox@developer-edition"
          "hazel"
          #"iterm2"
          "karabiner-elements"
          "moom"
          "plex"
          "sonos"
          "spotify"
          "sublime-text"
          "visual-studio-code"
          "wezterm"
        #] ++ lib.optionals (hostname != "EMB-2P2T1PXX") [
        #  "crossover"
        #  "steam"
        #] ++ lib.optionals (hostname == "EMB-2P2T1PXX") [
        ];
        masApps = {
          "Parcel" = 639968404;
          "Reeder" = 1529448980;
          "Things" = 904280696;
          "Xcode"  = 497799835;
        #} // lib.optionalAttrs (inputs.self.darwinConfigurations.hostname != "EMB-2P2T1PXX") {
        #  "Keynote" = 409183694;
        };
      };


      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      # programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      #nixpkgs.hostPlatform = system;
}
