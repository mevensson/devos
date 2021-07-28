{ ... }:
let
  name = "Mattias Evensson";
in
{
  home-manager.users.matte = { suites, ... }: {
    imports = suites.base;
  };

  users.users.matte = {
    uid = 1000;
    hashedPassword = "*";
    description = name;
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
