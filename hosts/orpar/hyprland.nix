{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    extraConfig = "source = ${../../.config/hypr/hyprland.conf}";
  };

  programs.waybar.enable = true;

  xdg.configFile."waybar/config.jsonc".source = ../../.config/waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = ../../.config/waybar/style.css;
}
