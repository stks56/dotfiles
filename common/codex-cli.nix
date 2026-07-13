{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.codex
  ];

  home.file = {
    ".codex/AGENTS.md".source =
      config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/AGENTS.md";
    ".codex/config.toml".source =
      config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/codex/config.toml";
    ".codex/prompts".source =
      config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/codex/prompts";
    ".codex/skills".source = config.lib.file.mkOutOfStoreSymlink "${config.agents.repository}/skills";
  };
}
