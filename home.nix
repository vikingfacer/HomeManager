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
    nix-prefetch-git
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

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  home.file = {
    ".tigrc".text = ''
      set main-view-id-display = yes
    '';

    ".vim".source = pkgs.fetchgit {
      url = "https://github.com/vikingfacer/.vim.git";
      sha256 = "1x4bdzlbbx09zkyna3ykxbmsrb5y4v63bj8x46vq3kb57f87ckqr";
      rev = "7964242f7171fd81c408fe2c994c44997c606ca1";
    };
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
