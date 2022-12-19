{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jacob";
  home.homeDirectory = "/home/jacob";

  programs.bash.initExtra = "
     export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  ";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    appimage-run
    bettercap
    bat
    curl
    docker
    file
    fzf
    git
    git-crypt
    (pkgs.callPackage ../../custom-packages/gyro-package.nix { })
    (pkgs.callPackage ../../custom-packages/zig-package.nix { })
    htop
    jrnl
    lynx
    python3
    screen
    vim_configurable
    rnix-lsp
    stun
    tig
    tree
    wol
    zoom-us
    zls
  ];

  programs.git = {
    enable=true;
    userName="JacobM";
    userEmail="jacobmontpetit@gmail.com";
    aliases={
      st="status";
    };
    extraConfig.core.editor = "vim";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


}
