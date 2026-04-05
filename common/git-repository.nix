{ ... }:

{
  services.git-sync = {
    enable = true;
    repositories = {
      cortex = {
        path = "/home/nixos/works/cortex";
        uri = "https://github.com/stks56/cortex.git";
        interval = 60;
      };
    };
  };
}
