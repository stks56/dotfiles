{ pkgs, ... }:

{
  programs.go = {
    enable = true;
    package = pkgs.go;
  };

  home.packages = [
    pkgs.gopls
    pkgs.golangci-lint
    pkgs.golangci-lint-langserver
    pkgs.gofumpt
  ];

  home.sessionVariables = {
    GOFLAGS = "-buildvcs=false";
  };
}
