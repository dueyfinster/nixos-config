{
  config,
  pkgs,
  ...
}: {

  home.packages = with pkgs; [
    (writeShellScriptBin "tm" (builtins.readFile ../../config/scripts/tm))
  ];
}
