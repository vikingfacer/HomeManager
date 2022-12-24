{ config, pkgs, ... }: {
  # First run this command this 
  # nix-shell '<home-manager>' -A install

  nixpkgs.config.allowUnfree = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    appimage-run
    bat
    bettercap
    curl
    docker
    file
    fzf
    git
    htop
    jrnl
    lynx
    nixfmt
    openocd
    python3
    rnix-lsp
    screen
    stun
    tig
    tree
    usbutils
    vim_configurable
    wol
    zls
    zoom-us
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jacob";
  home.homeDirectory = "/home/jacob";

  programs.bash = {
    initExtra = ''
      export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    '';

  };
  programs.git = {
    enable = true;
    userName = "JacobM";
    userEmail = "jacobmontpetit@gmail.com";
    aliases = { st = "status"; };
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
