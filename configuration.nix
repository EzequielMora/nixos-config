# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  ####################
  ## Bootloader
  ####################
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ####################
  ## Networking
  ####################
  networking.hostName = "aorus15p";
  networking.networkmanager.enable = true;

  ####################
  ## Time & Locale
  ####################
  time.timeZone = "America/Argentina/Cordoba";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "es_AR.UTF-8";
    LC_IDENTIFICATION = "es_AR.UTF-8";
    LC_MEASUREMENT    = "es_AR.UTF-8";
    LC_MONETARY       = "es_AR.UTF-8";
    LC_NAME           = "es_AR.UTF-8";
    LC_NUMERIC        = "es_AR.UTF-8";
    LC_PAPER          = "es_AR.UTF-8";
    LC_TELEPHONE      = "es_AR.UTF-8";
    LC_TIME           = "es_AR.UTF-8";
  };

  programs.bash.interactiveShellInit = ''
    fastfetch --config ~/.config/fastfetch/config-minimal.jsonc
  '';

  ####################
  ## X11 / Display / Desktop
  ####################
  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Teclado (ajustar layout si hace falta, ej. "latam")
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  ####################
  ## GNOME extensions
  ####################
  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.just-perfection
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator

    pavucontrol
    easyeffects

    git
    gh
    neovim
    wget
    curl
    btop
    htop
    nvtopPackages.nvidia
    pciutils
    wl-clipboard
    gnused
    fastfetch

    vscode

    python3
    python3Packages.pip

    nodejs

    gcc
    gnumake
    cmake

    firefox
    chromium
    wasistlos
    discord
    
    tailscale

    vlc
    obs-studio

    unzip
    zip
    p7zip

    tree
    ripgrep
    fd

    zsh
    starship
    fzf
    bat
    eza
  ];

  ####################
  ## Sonido (PipeWire)
  ####################
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true; # descomentar si necesitás soporte JACK
  };

  ####################
  ## Impresión
  ####################
  services.printing.enable = true;

  ####################
  ## Gráficos (OpenGL/Vulkan)
  ####################
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  ####################
  ## NVIDIA (Intel + RTX 3080 Laptop, Optimus)
  ####################
  # Driver NVIDIA propietario (recomendado para RTX 30 series en portátiles)
  hardware.nvidia = {
    modesetting.enable = true;

    # Suspensión: útil en laptops, no experimental
    powerManagement.enable = true;
    powerManagement.finegrained = false;

    # Usar el driver propietario (no el kernel module "open",
    # que aún no es la opción recomendada para tarjetas Ampere en laptop)
    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Configuración Optimus: PRIME offload (Intel maneja el display,
    # NVIDIA se usa on-demand). Ajustá los Bus ID según tu hardware:
    # Ejecutá `lspci | grep -E "VGA|3D"` para confirmarlos.
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  ####################
  ## Docker
  ####################
  virtualisation.docker.enable = true;

  ####################
  ## Tailscale
  ####################
  services.tailscale.enable = true;

  ####################
  ## Usuario
  ####################
  users.users.mora = {
    isNormalUser = true;
    description = "mora";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    packages = with pkgs; [ ];
  };

  ####################
  ## Unfree packages
  ####################
  nixpkgs.config.allowUnfree = true;

  ####################
  ## Programas
  ####################
  programs.firefox.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.mtr.enable = true;

  ####################
  ## Versión del sistema
  ####################
  system.stateVersion = "25.11";
}
