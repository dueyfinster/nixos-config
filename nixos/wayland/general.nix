{ config, pkgs, ...}:
{
  environment.extraInit = ''
      #Turn off gui for ssh auth
      unset -v SSH_ASKPASS
    '';
  users.users.ngrogan.extraGroups = [ "video" "docker" ];
  programs.light.enable = true;
}
