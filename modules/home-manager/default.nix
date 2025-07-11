{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    #./btop.nix
    ./anki.nix
    ./bat.nix
    ./calibre.nix
    ./direnv.nix
    ./drawio.nix
    ./evince.nix
    ./fzf.nix
    ./ghostty.nix
    ./git.nix
    ./neovim
    ./kubectl.nix
    ./ripgrep.nix
    ./scripts.nix
    ./shell-aliases.nix
    ./starship
    ./thonny.nix
    # ./tmux.nix
    ./wine.nix
    ./zsh.nix
    ./zoxide.nix
  ];
}
