{ config, ... }:

{
  programs.neovim.enable = true;

  home.file = {
    ".config/nvim" = {
      source = builtins.filterSource (path: _: baseNameOf path != "lazy-lock.json") ../.config/nvim;
      recursive = true;
    };
    ".config/nvim/lazy-lock.json".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/nvim/lazy-lock.json";
  };
}
