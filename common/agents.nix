{ config, lib, ... }:

{
  options.agents.repository = lib.mkOption {
    type = lib.types.str;
    default = "${config.home.homeDirectory}/dotagents";
    description = "Path to the agents configuration.";
  };
}
