{ pkgs, ... }:

{
  imports = [
    ../../common
    ./fcitx5.nix
    ./hyprland.nix
    ./waybar.nix
    ./waypaper.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "stks56";
  home.homeDirectory = "/home/stks56";

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nixos/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  home.file = {
    ".config/wezterm".source = ../../.config/wezterm;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
