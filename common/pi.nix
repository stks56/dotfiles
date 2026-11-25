{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.llm-agents.pi
    pkgs.llm-agents.pi-acp
  ];

  home.file = {
    ".pi/agent/AGENTS.md".source =
      config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/AGENTS.md";
    ".pi/agent/settings.json" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/pi/settings.json";
      force = true;
    };
    ".pi/agent/models.json" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/pi/models.json";
      force = true;
    };
    ".pi/agent/themes".source =
      config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/pi/themes";
  };
}
