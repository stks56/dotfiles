{ pkgs, ... }:

{
  home.packages = [
    pkgs.llm-agents.gemini-cli
  ];
}
