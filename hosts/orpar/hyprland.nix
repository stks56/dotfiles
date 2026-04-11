{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = "source = ${../../.config/hypr/hyprland.conf}";
  };
}
