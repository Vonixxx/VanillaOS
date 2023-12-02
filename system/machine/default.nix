###########
# VonixOS #
#########################
# Machine Configuration #
#########################
{ pkgs, vars, ... }:

{
 imports = [ ./hardware-configuration.nix ];

 boot = {
   loader = {
     timeout = 5;
     systemd-boot = {
       configurationLimit = 5;
       enable             = true;
     };
     efi = { canTouchEfiVariables = true; };
   };
 };
}
