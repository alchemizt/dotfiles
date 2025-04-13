{ config, pkgs, ... }: {
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git
    curl
    zsh
    nemo
  ];

  programs.zsh.enable = true;

  home.sessionVariables = {
    EDITOR = "nano";
  };
}
