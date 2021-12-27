{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    displaycal
    python
    python3
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "python2.7-Pillow-6.2.2"
  ];
}

