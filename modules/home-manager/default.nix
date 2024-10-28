{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    #./btop.nix
    ./direnv.nix
    ./evince.nix
    ./fzf.nix
    ./git.nix
    #./neovim.nix
    ./ripgrep.nix
    ./shell-aliases.nix
    ./starship.nix
    ./thonny.nix
    ./tmux.nix
    ./wine.nix
    ./zsh.nix
    ./zoxide.nix
  ];
}
