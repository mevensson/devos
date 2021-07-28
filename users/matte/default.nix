{ self, ... }:
let
  name = "Mattias Evensson";
in
{

  age.secrets.matte_password.file = "${self}/secrets/matte_password.age";
  age.secrets.matte_id_ed25519.file = "${self}/secrets/matte_id_ed25519.age";

  home-manager.users.matte = { suites, lib, ... }: {
    imports = suites.base;

    home = {
      activation.myActivationAction =
        lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          mkdir -p ~/.ssh
          ln -sf /run/secrets/matte_id_ed25519 ~/.ssh/id_ed25519
        '';

      file = {
        ".ssh/id_ed25519.pub".source = ./id_ed25519.pub;
      };
    };
  };

  users.users.matte = {
    uid = 1000;
    passwordFile = "/run/secrets/matte";
    description = name;
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.users.nrd.openssh.authorizedKeys.keyFiles = [ ./id_ed25519.pub ];

}
