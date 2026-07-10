# NixOS config - Gigabyte AORUS 15P

- Intel + NVIDIA RTX 3080 Laptop (Optimus, PRIME offload)
- GNOME + GDM + Wayland/X11
- Usuario: mora

## Cómo restaurar en una instalación nueva
1. Instalar NixOS normalmente
2. `sudo nixos-generate-config` (genera hardware-configuration.nix nuevo — el hardware puede cambiar)
3. Clonar este repo
4. Symlinkear configuration.nix a /etc/nixos/
5. sudo nixos-rebuild switch
