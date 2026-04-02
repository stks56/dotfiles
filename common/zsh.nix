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
}
