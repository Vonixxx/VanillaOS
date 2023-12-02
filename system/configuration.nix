#############
# VanillaOS #
#######################
# NixOS Configuration #
#######################
{ lib, nur, pkgs, vars, config, inputs, home-manager, ... }:

{
 imports = ( 
   import ../modules/desktops ++
   import ../modules/programs 
 );

 system.stateVersion = "23.11"; 

 home-manager.users.${vars.user} = {
   imports = [ nur.nixosModules.nur ];
   programs.home-manager.enable = true;
   home.stateVersion            = "23.11";
 };

 fonts.packages = with pkgs; [
   liberation_ttf
 ];

 environment.systemPackages = with pkgs; [
   coreutils
   freetube
   libreoffice-fresh
 ];

 programs.dconf.enable = true;

 hardware.opengl = {
   enable          = true;
   driSupport      = true;
   driSupport32Bit = true;
   extraPackages = with pkgs; [
     vaapiVdpau
     libvdpau-va-gl
   ];
 };

 boot.kernelParams = [ "quiet"]; 

 networking = {
   firewall.enable       = true;
   networkmanager.enable = true;
 };

 security = {
   rtkit.enable            = true;
   polkit.enable           = true;
   sudo.wheelNeedsPassword = true;
 };

 i18n.defaultLocale = "en_GB.UTF-8";

 hardware.pulseaudio.enable = false;

 services = {
   pipewire = {
     enable            = true;
     alsa.enable       = true;
     pulse.enable      = true;
     alsa.support32Bit = true;
   };
   automatic-timezoned.enable = true;
 };

 system.autoUpgrade = {
   enable     = true;  
   persistent = true;
   dates      = "daily";
   flake      = "github:Vonixxx/VanillaOS#default";
 };

 nix = {
   gc = {
     automatic = true;
     dates     = "weekly";
     options   = "--delete-older-than 3d";
   };
   settings = {
     auto-optimise-store   = true;
     experimental-features = [ "nix-command" "flakes" ];
   };
 }; 

 users = {
   users.${vars.user} = {
     isNormalUser   = true;
     hashedPassword = "${vars.password}";
     extraGroups    = [ "audio" "users" "video" "wheel" "networkmanager" ];
   };
 };
}
