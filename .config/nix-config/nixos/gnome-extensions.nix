{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnomeExtensions.useless-gaps
    gnomeExtensions.gamemode-indicator-in-system-settings
    gnomeExtensions.rounded-corners
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.app-hider
    gnomeExtensions.gnome-40-ui-improvements
    gnomeExtensions.gsconnect
    gnomeExtensions.night-theme-switcher
    gnomeExtensions.panel-scroll
    gnomeExtensions.panel-corners
  ];
}
