{ config, ... }:

{
  services.git-sync = {
    enable = true;
    repositories = {
      cortex = {
        path = "${config.home.homeDirectory}/cortex";
        uri = "https://github.com/stks56/cortex.git";
        interval = 60;
      };
    };
  };
}
