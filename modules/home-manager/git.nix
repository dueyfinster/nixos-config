{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Neil Grogan";
    userEmail = "neil@grogan.org";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  home.shellAliases = {
    gc = "git commit -m";
    gp = "git push";
    gs = "git status";
  };
}
