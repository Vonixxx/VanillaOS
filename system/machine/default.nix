###########
# VonixOS #
#########################
# Machine Configuration #
#########################
{ pkgs, vars, ... }:

{
 imports = [ ./hardware-configuration.nix ];

 services = { 
   tlp.enable                   = true; 
   power-profiles-daemon.enable = false;
 };

 boot = {
   timeout = 5;

   systemd-boot = {
     configurationLimit = 5;
     enable             = true;
   };

   loader.efi = { canTouchEfiVariables = true; };
 };
}
