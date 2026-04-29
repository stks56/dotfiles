{ pkgs, ... }:

{
  home.packages = with pkgs; [
    walker
    elephant
  ];
}
