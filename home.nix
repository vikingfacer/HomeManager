{ config, pkgs, ... }: {
  # First run this command this
  # nix-shell '<home-manager>' -A install

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    appimage-run
    bat
    bettercap
    curl
    discord
    docker
    file
    fzf
    git
    htop
    jrnl
    lynx
    nix-prefetch-git
    nixfmt
    obs-studio
    openocd
    python3
    screen
    silver-searcher
    stlink
    stun
    thefuck
    tig
    tree
    usbutils
    vim_configurable
    vlc
    wol
    xclip
    zls
    zoom-us
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jacob";
  home.homeDirectory = "/home/jacob";

  home.sessionVariables = { HF = "/home/jacob/.config/nixpkgs/home.nix"; };

  programs.zsh = {
    enable = true;
    initExtra = ''
      export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
      eval "$(direnv hook zsh)"
      eval $(thefuck --alias)
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "afowler";
    };
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

    ".config/discord/settings.json".text = ''
      { "SKIP_HOST_UPDATE": true }
    '';

    ".tigrc".text = ''
      set main-view-id-display = yes
    '';

    #".vim".source = pkgs.fetchgit {
    #  url = "https://github.com/vikingfacer/.vim.git";
    #  sha256 = "084k925j5sdrvbbb4xn778vfgrn42n30iwirzwq9hfwcv6im1sgv";
    #  rev = "b307698";
    #  fetchSubmodules = true;
    #};
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
