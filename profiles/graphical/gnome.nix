{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome3.gnome-tweaks
    firefox
    variety
  ];

  fonts.fonts = [ pkgs.corefonts ];

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
      desktopManager.gnome3 = {
        enable = true;
      };
    };
  };
}
