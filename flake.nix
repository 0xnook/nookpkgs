{
  description = "A collection of nix packages and nixos modules by nook";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }: 
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ self.overlays.default ];
    };
  in
  {
    packages.${system} = pkgs.nookpkgs;
    overlays.default = import ./packages/overlay.nix;
  };
}

