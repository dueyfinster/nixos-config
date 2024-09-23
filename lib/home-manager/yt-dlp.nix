{ pkgs, inputs, ... }:
{
  home.packages = with inputs.nixpkgs-unstable; [
    pkgs.yt-dlp
  ];
}
