{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    extraConfig = "source = ${../../.config/hypr/hyprland.conf}";
  };

  programs.waybar.enable = true;

  xdg.configFile."waybar/config.jsonc".source = ../../.config/waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = ../../.config/waybar/style.css;
  xdg.configFile."waypaper/config.ini".source = pkgs.replaceVars ../../.config/waypaper/config.ini {
    homeDirectory = config.home.homeDirectory;
  };
  xdg.configFile."waypaper/style.css".source = ../../.config/waypaper/style.css;
  xdg.configFile."hypr/hyprpaper.conf".source = ../../.config/hypr/hyprpaper.conf;
  xdg.configFile."hypr/wallpapers".source = ../../.config/hypr/wallpapers;
}
