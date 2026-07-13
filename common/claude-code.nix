{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.claude-code
  ];

  home.file = {
    ".claude/CLAUDE.md".source =
      config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/AGENTS.md";
    ".claude/settings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/claude/settings.json";
    ".claude/statusline.sh".source =
      config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/claude/statusline.sh";
    ".claude/agents".source = config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/agents";
    ".claude/commands".source =
      config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/claude/commands";
    ".claude/hooks".source =
      config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/claude/hooks";
    ".claude/skills".source = config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/skills";
  };
}
