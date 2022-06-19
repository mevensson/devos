{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vscode-fhs
  ];

  nixpkgs.config.allowUnfree = true;
}
