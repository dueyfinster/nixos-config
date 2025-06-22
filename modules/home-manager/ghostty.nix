{pkgs, ...}: {
  xdg.configFile."ghostty/config".text =
    # toml
    ''
      ##font-family = "Departure Mono"
      font-size = 16

      ## uncomment once keybindings have been set to something I am familiar
      ## with. The bar contains the menu, which I need for splits for now…
      # gtk-titlebar = false

      theme = "catppuccin-frappe"
    '';

  home.packages = [pkgs.ghostty];
}
