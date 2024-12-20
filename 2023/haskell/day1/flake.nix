{
  description = "Haskell Hello World project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        haskellPackages = pkgs.haskellPackages.ghc.withPackages (hp: [
          hp.random # example adding package random
        ]);
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            haskellPackages
            pkgs.cabal-install
          ];
          shellHook = ''
            echo "Welcome to the Haskell development environment!"
            #ghc Main.hs -o hello
            #./hello
            echo "Run with:"
            echo "ghc Main.hs -o hello && ./hello"
            #git clean -fdx
          '';
        };
      });
}
