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
    ./shell-aliases.nix
    ./starship.nix
    ./thonny.nix
    ./wine.nix
    ./zsh.nix
    ./zoxide.nix
  ];
}
