{
  programs.claude-code = {
    enable = true;
  };

  home.file = {
    ".claude" = {
      source = ../.config/claude;
      recursive = true;
    };
  };
}
