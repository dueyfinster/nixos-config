{ config, pkgs, ...}:
{
  hardware.graphics.enable = true;
  
  environment.extraInit = ''
      #Turn off gui for ssh auth
      unset -v SSH_ASKPASS
    '';
  users.users.ngrogan.extraGroups = [ "video" "docker" ];
  programs.light.enable = true;
}
