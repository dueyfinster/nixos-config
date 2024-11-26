{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    #./btop.nix
    ./anki.nix
    ./calibre.nix
    ./direnv.nix
    ./drawio.nix
    ./evince.nix
    ./fzf.nix
    ./git.nix
    #./neovim.nix
    ./kubectl.nix
    ./ripgrep.nix
    ./scripts.nix
    ./shell-aliases.nix
    ./starship.nix
    ./thonny.nix
    ./tmux.nix
    ./wine.nix
    ./zsh.nix
    ./zoxide.nix
  ];
}
