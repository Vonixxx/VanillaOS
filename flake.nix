#############
# VanillaOS #
#######################
# Flake Configuration #
#######################
# flake.nix
# └─./system
#     └─default.nix
#       ├─./machine
#       └─configuration.nix
#         └─./modules
#             ├─./desktops
#             │   └─default.nix
#             └─./programs
#                 └─default.nix
{
 description = "Flake Configuration - Gnome";

 inputs = {
   ##########################
   # Synchronizing Packages #
   ##########################
   home-manager.inputs.nixpkgs.follows = "nixpkgs";
   ###################
   # Repository URLs #
   ###################
   nur.url          = "github:nix-community/NUR";
   nixpkgs.url      = "github:nixos/nixpkgs/nixos-23.11";
   home-manager.url = "github:nix-community/home-manager"; 
 };

 outputs = inputs @ { nur, self, nixpkgs, home-manager, ... }:
 let
  vars = {
    user     = "bubinka";
    password = "$6$vheawoZJxxe9N7Ml$sGnV.OE9HFDY0MQzDLUuSX38f8GPPus.cD45ptYi.Whyx1aJ5xEuHUYoz0LT/CcDP5dFbw7AdOeG7hahoeA170";
  };
 in {
   nixosConfigurations = (
     import ./system {
      inherit (nixpkgs) lib;
      inherit nur vars inputs nixpkgs home-manager;
     }
   );
 };
}
