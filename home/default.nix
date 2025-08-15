{ pkgs, ... }:

{
  # General home stuff.
  home.username = "nixosvm";
  home.homeDirectory = "/home/nixosvm";
  home.stateVersion = "25.05";
  home.packages = [
    pkgs.fd
    pkgs.librewolf
    pkgs.mpv
    pkgs.podman-compose
    pkgs.unzip
    pkgs.unrar
    pkgs.wl-clipboard
    # Fonts.
    pkgs.maple-mono.NF
  ];

  # Fontconfig stuff.
  fonts.fontconfig.enable = true;

  # Let home-manager update itself.
  programs.home-manager.enable = true;

  # Allow unfree.
  nixpkgs.config.allowUnfree = true;

  # Modules.
  imports = [
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    ./fzf.nix
    ./fish.nix
    ./git.nix
    ./ghostty.nix
    ./helix.nix
    ./yazi.nix
    ./zoxide.nix
  ];
}
