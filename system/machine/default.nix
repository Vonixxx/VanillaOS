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

 boot.loader = {
   timeout = 5;

   systemd-boot = {
     configurationLimit = 5;
     enable             = true;
   };

   efi = { canTouchEfiVariables = true; };
 };

 hardware.cpu.intel.updateMicrocode = true;
}
