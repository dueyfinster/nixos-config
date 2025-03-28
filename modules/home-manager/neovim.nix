{
  pkgs,
  config,
  lib,
  ...
}: let
  treesitterWithGrammars = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
    p.bash
    p.comment
    p.css
    p.dockerfile
    p.elixir
    p.fish
    p.gitattributes
    p.gitignore
    p.go
    p.gomod
    p.gowork
    p.hcl
    p.html
    p.javascript
    p.jq
    p.json5
    p.json
    p.lua
    p.make
    p.markdown
    p.nix
    p.python
    p.ruby
    p.rust
    p.sql
    p.toml
    p.typescript
    p.terraform
    p.vim
    p.xml
    p.yaml
  ]);

  treesitter-parsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = treesitterWithGrammars.dependencies;
  };
in {
  home.packages = with pkgs; [
    fd
    fzf
    ripgrep
    gcc
    gnumake
    docker-ls
    gopls
    helm-ls
    lua-language-server
    nil # nix language server
    nodePackages_latest.bash-language-server
    nodePackages_latest.typescript-language-server
    vscode-langservers-extracted
    pyright
    stylua
    yaml-language-server
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    package = pkgs.neovim-unwrapped;

    plugins = [
      treesitterWithGrammars
    ];
    extraLuaConfig = ''

      ${builtins.readFile /home/ngrogan/.dotfiles/nvim/.config/nvim/init.lua}
      vim.opt.runtimepath:prepend("${treesitter-parsers}")
    '';
  };

  # Treesitter is configured as a locally developed module in lazy.nvim
  # we hardcode a symlink here so that we can refer to it in our lazy config
  # SEE: https://github.com/Kidsan/nixos-config/blob/main/home/programs/neovim/default.nix
  home.file."./.local/share/nvim/nix/nvim-treesitter/" = {
    recursive = true;
    source = treesitterWithGrammars;
  };

  home.file."./.config/nvim/lua" = {
    source = config.lib.file.mkOutOfStoreSymlink /home/ngrogan/.dotfiles/nvim/.config/nvim/lua;
    recursive = true;
  };
}
