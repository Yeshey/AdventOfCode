# shell.nix
# Info from the wiki: https://nixos.wiki/wiki/Python
# And this video: https://www.youtube.com/watch?v=k7NKBfeYXCk
# run with nix-shell pyshell.nix
{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
    buildInputs =
      let
        inherit (pkgs) haskellPackages;
        ghcPkgs = hpkgs:
          with hpkgs; [
            MonadRandom

            aeson
            cryptonite
            fingertree
            hashable
            lens
            megaparsec
            multiset
            pipes
            split
            unordered-containers
            vector
          ];
      in
      [ (haskellPackages.ghcWithPackages ghcPkgs) ];
  shellHook = ''
    echo "
      Shell for: Haskell
      Compile and run with: 
        ghc -O2 run.hs && time ./run "
  '';
}