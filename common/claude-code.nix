{ config, pkgs, ... }:

let
  mkLink =
    path:
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/claude/${path}";
in
{
  home.packages = [
    pkgs.claude-code
  ];

  home.file = {
    ".claude/settings.json".source = mkLink "settings.json";
    ".claude/statusline.sh".source = mkLink "statusline.sh";
    ".claude/CLAUDE.md".source = mkLink "CLAUDE.md";
    ".claude/RTK.md".source = mkLink "RTK.md";
    ".claude/hooks".source = mkLink "hooks";
    ".claude/skills".source = mkLink "skills";
  };
}
