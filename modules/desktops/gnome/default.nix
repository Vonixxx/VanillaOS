#############
# VanillaOS #
#######################
# Gnome Configuration #
#######################
{ pkgs, config, ... }:

{
 services.xserver = {
   layout = "cz";
   enable = true;
   desktopManager = {
     gnome.enable = true;
   };
   displayManager = {
     gdm.enable = true;
     defaultSession = "gnome";
   };
 };
 
 environment.systemPackages = with pkgs.gnomeExtensions; [
   arcmenu
   burn-my-windows
   dash-to-panel
   space-bar
   user-themes
 ];

 environment.gnome.excludePackages = with pkgs.gnome; [
   atomix
   epiphany
   hitori
   iagno
   tali
 ];
}
