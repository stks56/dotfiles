{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
    };
  };

  xdg.configFile."waypaper/config.ini".source = pkgs.replaceVars ../../.config/waypaper/config.ini {
    homeDirectory = config.home.homeDirectory;
  };
  xdg.configFile."waypaper/style.css".source = ../../.config/waypaper/style.css;
  xdg.configFile."hypr/wallpapers".source = ../../.config/hypr/wallpapers;
}
