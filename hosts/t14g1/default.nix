{ suites, config, pkgs, ... }:

{
  imports = suites.desktop ++
    [
      ./hardware.nix
    ];

  system.stateVersion = "21.05"; # Did you read the comment?

}
