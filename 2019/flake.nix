# References
# https://nixos.wiki/wiki/Flakes
# https://github.com/Prillan/adventofcode-solutions

{
  description = "Attempting to nixify Advent Of Code";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; 
        langs = import ./langs.nix { inherit pkgs; };
        in {
          devShells.default = import ./hs_shell.nix { inherit pkgs; };
          devShells.hs = import ./hs_shell.nix { inherit pkgs; };
          devShells.py = import ./py_shell.nix { inherit pkgs; };
        }
      );
}