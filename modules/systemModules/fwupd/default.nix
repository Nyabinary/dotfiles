{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: {
  options.systemModules.fwupd.nyan.enable = lib.mkEnableOption "";
  options.systemModules.fwupd.binary.enable = lib.mkEnableOption "";

  config = lib.mkMerge [
    #(lib.mkIf config.systemModules.NAME.FW16.enable {
    #module

    #})
    (lib.mkIf config.systemModules.fwupd.binary.enable {
      service.fwupd = {
        enable = true;
        extraRemotes = ["lvfs-testing"];
      };
    })
  ];
}
