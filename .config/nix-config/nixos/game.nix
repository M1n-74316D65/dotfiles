{ config, pkgs, ... }:
{
  programs.steam.enable = true;
  hardware.opengl.driSupport = true;
  # For 32 bit applications
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
  ];

  environment.systemPackages = with pkgs; [
    lutris
    gamemode
  ];
}
