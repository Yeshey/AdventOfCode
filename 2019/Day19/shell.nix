# Open AI's chat bot solution
# https://chat.openai.com/chat

{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "problem";

  buildInputs = [ pkgs.haskellPackages.intcode ];

  src = ./.;
  doCheck = true;

  # This is the entry point for the program
  # It tells nix how to run the program
  shellHook = ''
    ghc problem.hs
    ./problem
  '';
}