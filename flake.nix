{
  description = "a NixOS flake for joplin-desktop.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    packages.${system} = {
      joplin-desktop =
        pkgs.callPackage ./default.nix {
        };
      default = self.packages.${system}.joplin-desktop;
    };
  };
}
