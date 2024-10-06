{
  lib,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv) isDarwin;
  darwinAliases = {
    nrb = "darwin-rebuild switch --flake .";
  };
  nixosAliases = {
    nrb = "sudo nixos-rebuild switch --impure --flake .";
  };
in {
  home.shellAliases =
    {
      l = "eza -lh --group-directories-first -F --icons";
      la = "eza -aalhF --group-directories-first --icons";
      lt = "eza --tree --icons -d -a --ignore-glob '**/.git'";
      tm = "tmux new-session -A -s main";
      type = "type -a";
      rg = "rg -i -L";
      vimdiff = "nvim -d";
      mkdir = "mkdir -p";

      # quick cd
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";

      # Home manager rebuild
      hrb = "nix run home-manager -- switch --flake .";

      # virsh
      virsh = "virsh --connect='qemu:///system'";
      virt-install = "virt-install --connect 'qemu:///system'";
      ssh = "TERM=xterm-256color ssh";
    }
    // (
      if isDarwin
      then darwinAliases
      else nixosAliases
    );
}
