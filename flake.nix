{
  description = "A collection of nix packages and nixos modules by nook";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }: 
  {
    overlays.default = import ./packages/overlay.nix;
  };
}

