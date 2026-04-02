{ pkgs, ... }:

{
  programs.go = {
    enable = true;
    package = pkgs.go;
  };

  home.packages = [
    pkgs.gopls
    pkgs.golangci-lint
  ];

  home.sessionVariables = {
    GOFLAGS = "-buildvcs=false";
  };
}
