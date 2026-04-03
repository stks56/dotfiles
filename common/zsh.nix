{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=6";
    };
    syntaxHighlighting.enable = true;

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
      settings = {
        keymap_mode = "emacs";
      };
    };
  };
}
