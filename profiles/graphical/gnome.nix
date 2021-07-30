{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome3.gnome-tweaks
    firefox
    variety
  ];

  boot.plymouth.enable = true;

  fonts.fonts = with pkgs; [
    corefonts
    fira-code
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

  services = {
    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      layout = "se";

      # Enable touchpad support.
      libinput = {
        enable = true;
      };

      # Enable the GNOME Desktop Environment.
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      desktopManager.gnome = {
        enable = true;
      };
    };
  };
}
