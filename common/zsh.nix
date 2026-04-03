{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=6";
    };
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";

    zsh-abbr = {
      enable = true;
      abbreviations = {
        d = "docker";
        g = "git";
        h = "history";
        k = "kubectl";
        lg = "lazygit";
        v = "nvim";
      };
    };
  };

  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        add_newline = false;
        # format = "$time" + "$all";
        # time = {
        #   disabled = false;
        #   format = "[\\\[$time\\\]]($style)";
        #   time_format = "%T";
        # };
      };
    };

    atuin = {
      enable = true;
      enableZshIntegration = true;
      flags = [
        "--disable-up-arrow"
      ];
      settings = {
        keymap_mode = "emacs";
      };
    };
  };
}
