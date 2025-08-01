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
      pull.rebase = true;
    };
  };

  home.packages = with pkgs; [
    lazygit
  ];

  home.shellAliases = {
    # Git
    g = "git";
    # ga = "git add";
    gaa = "git add --all";
    # Git commit
    gc = "git commit --verbose";
    gcs = "git commit --verbose --sign";
    gca = "git commit --verbose --amend";
    gcaa = "git commit --verbose --amend --all";

    # gd = "git diff";
    gdc = "git diff --cached";

    gco = "git checkout";
    gcm = "git checkout master";

    gs = "git status";
    gss = "git status --short";

    # grh = "git reset";
    grhh = "git reset --hard";

    gf = "git fetch";
    # a pull, is a fetch and merge
    gfm = "git pull";

    gp = "git push";
    gpF = "git push --force";
    gpf = "git push --force-with-lease";
    gpc = "git push --set-upstream origin HEAD";

    # git clone
    gcl = "git clone --recursive-submodules";

    # Git rebase sign commits
    grsc = "git rebase --exec 'git commit --amend --no-edit -n -S' -i";

    gl = "git log --topo-order --pretty=format:'%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'";
    glb = "git log --topo-order --pretty=format:'%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'";
    glg = "git log --topo-order --all --graph --pretty=format:'%C(green)%h%C(reset) %s%C(red)%d %C(reset)%C(blue)Sig:%G?%C(reset)%n'";
  };
}
