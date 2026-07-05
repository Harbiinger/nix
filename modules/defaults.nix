{ lib, den, ... }:
{
  den.default.nixos.system.stateVersion = "25.11";
  den.default.homeManager.home.stateVersion = "25.11";

  # enable hm by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  # host<->user provides
  den.schema.user.includes = [ den._.mutual-provider ];

  den.default.includes = [ den.provides.hostname den.provides.define-user ];

}
