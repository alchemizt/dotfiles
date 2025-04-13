{ config, pkgs, ... }:

let
  zshPluginDir = "${config.home.homeDirectory}/.oh-my-zsh/custom/plugins";
in
{
  home.file."${zshPluginDir}/zsh-you-should-use".source = ./../zsh-plugins/zsh-you-should-use;
  home.file."${zshPluginDir}/spaceship-prompt".source = ./../zsh-plugins/spaceship-prompt;

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    initExtra = ''
      export ZSH="$HOME/.oh-my-zsh"
      ZSH_THEME="spaceship"
      plugins=(git zsh-you-should-use spaceship-prompt)

      source "$ZSH/oh-my-zsh.sh"
    '';
  };
}
