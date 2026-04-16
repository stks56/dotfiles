{ ... }:

let
  terminal = "wezterm";
  browser = "firefox";
  mainMod = "SUPER";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    settings = {
      monitor = ",highres,auto,auto";

      exec-once = [
        "waybar"
        "waypaper --restore"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "master";
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear, 0, 0, 1, 1"
          "almostLinear, 0.5, 0.5, 0.75, 1"
          "quick, 0.15, 0, 0.1, 1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
          "zoomFactor, 1, 7, quick"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
        mfact = 0.45;
        orientation = "center";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      input = {
        kb_layout = "us";
        kb_options = "altwin:swap_alt_win";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      gesture = "3, horizontal, workspace";

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      bind = [
        "${mainMod}, C, killactive,"
        "${mainMod}, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
        "${mainMod}, V, togglefloating,"
        "${mainMod}, P, pseudo,"
        # Application
        "${mainMod} SHIFT, Q, exec, ${terminal}"
        "${mainMod}, Q, focuswindow, class:^.*${terminal}$"
        "${mainMod}, Q, layoutmsg, swapwithmaster ignoremaster"
        "${mainMod} SHIFT, B, exec, ${browser}"
        "${mainMod}, B, focuswindow, class:^.*${browser}$"
        "${mainMod}, B, layoutmsg, swapwithmaster ignoremaster"
        "${mainMod}, W, exec, waypaper"
        # Tiling
        "${mainMod}, Return, layoutmsg, swapwithmaster"
        "${mainMod}, Tab, layoutmsg, cyclenext"
        "${mainMod} SHIFT, Tab, layoutmsg, cycleprev"
        # Move focus
        "${mainMod}, H, movefocus, l"
        "${mainMod}, L, movefocus, r"
        "${mainMod}, K, movefocus, u"
        "${mainMod}, J, movefocus, d"
      ]
      # Workspace 1-10
      ++ (builtins.genList (
        i: "${mainMod}, ${toString (if i == 9 then 0 else i + 1)}, workspace, ${toString (i + 1)}"
      ) 10)
      ++ (builtins.genList (
        i:
        "${mainMod} SHIFT, ${toString (if i == 9 then 0 else i + 1)}, movetoworkspace, ${toString (i + 1)}"
      ) 10)
      ++ [
        # Special workspace
        "${mainMod}, S, togglespecialworkspace, magic"
        "${mainMod} SHIFT, S, movetoworkspace, special:magic"
        # Mouse
        "${mainMod}, mouse_down, workspace, e+1"
        "${mainMod}, mouse_up, workspace, e-1"
      ];

      bindm = [
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      windowrule = [
        {
          name = "suppress-maximize-events";
          "match:class" = ".*";
          suppress_event = "maximize";
        }
        {
          name = "fix-xwayland-drags";
          "match:class" = "^$";
          "match:title" = "^$";
          "match:xwayland" = true;
          "match:float" = true;
          "match:fullscreen" = false;
          "match:pin" = false;
          no_focus = true;
        }
        {
          name = "move-hyprland-run";
          "match:class" = "hyprland-run";
          move = "20 monitor_h-120";
          float = "yes";
        }
      ];
    };
  };
}
