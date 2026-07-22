{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.codex
  ];

  home.file = {
    ".agents/AGENTS.md".source =
      config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/AGENTS.md";
    ".agents/config.toml".source =
      config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/codex/config.toml";
    ".agents/prompts".source =
      config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/codex/prompts";
    ".agents/skills" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/skills";
      force = true;
    };
  };
}
