{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    black
    gcc
    golangci-lint
    gopls
    gotools
    hadolint
    helm-ls
    isort
    lua-language-server
    markdownlint-cli
    nil
    nixd
    nodePackages.bash-language-server
    nodePackages.prettier
    pyright
    ruff
    shellcheck
    shfmt
    stylua
    terraform-ls
    tflint
    vscode-langservers-extracted
    yaml-language-server
  ];

  # Neovim text editor configuration
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    package = pkgs.neovim-unwrapped;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
  };

  # source lua config from this repo
  xdg.configFile = {
    "nvim" = {
      source = ./lazyvim;
      recursive = true;
    };
  };
}
