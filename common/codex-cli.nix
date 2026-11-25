{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.llm-agents.codex
    pkgs.llm-agents.codex-acp
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
