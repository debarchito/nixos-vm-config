{ pkgs, ... }:

{
  # General home stuff.
  home.username = "nixosvm";
  home.homeDirectory = "/home/nixosvm";
  home.stateVersion = "25.05";
  home.packages = [
    pkgs.librewolf
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
    ./ghostty.nix
    ./yazi.nix
    ./zoxide.nix
  ];
}
