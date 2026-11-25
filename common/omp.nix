{ pkgs, ... }:

{
  home.packages = [
    pkgs.llm-agents.omp
  ];
}
