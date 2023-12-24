#############
# VanillaOS #
#######################
# Gnome Configuration #
#######################
{ pkgs, config, ... }:

{
 services = {
   xserver = {
     layout = "cz";
     enable = true;

     desktopManager = {
       gnome.enable = true;
     };

     displayManager = {
       gdm = { 
         enable = true; 
         wayland = true;
       };
       defaultSession = "gnome";
     };
   };

   logind.lidSwitch = "poweroff";
 };

 hardware.pulseaudio.enable = false;

 environment.systemPackages = with pkgs.gnomeExtensions; [
   arcmenu
   burn-my-windows
   dash-to-panel
   space-bar
   user-themes
 ];

 environment.gnome.excludePackages = (with pkgs.gnome; [
   atomix
   epiphany
   gnome-shell-extensions
   hitori
   iagno
   tali
 ]) ++ (with pkgs.gnome; [
    gnome-tweaks
 ]);

 programs.bash.shellAliases = { update = "sudo nix flake update 'github:Vonixxx/VanillaOS' && sudo nixos-rebuild switch --no-write-lock-file --flake 'github:Vonixxx/VanillaOS#default'"; };
}
