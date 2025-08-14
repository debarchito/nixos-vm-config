{ pkgs, ... }:

{
  # Some stuff that should exist independently.
  system.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;

  # Fine-grained boot stuff.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Zram stuff.
  zramSwap.enable = true;

  # Fine-grained localization stuff.
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Common stuff.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.auto-optimise-store = true;
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--delete-older-than 7d";
    flake = "/home/nixosvm/.dotfiles";
  };

  # Security stuff.
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  # Networking stuff.
  networking = {
    hostName = "nixosvm";
    networkmanager.enable = true;
  };

  # Media stuff.
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Experimental = true;
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Display manager and desktop environment stuff.
  services.displayManager.ly.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Containers stuff.
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
  environment.systemPackages = [
    pkgs.crun
  ];

  # The user!
  users.users.nixosvm = {
    isNormalUser = true;
    description = "NixOS Virtual Machine";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "bluetooth"
    ];
  };

  # Variables stuff.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
