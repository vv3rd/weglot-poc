{ pkgs ? import <nixpkgs> {} }:
let
  inherit (pkgs) nodejs;
in
pkgs.mkShell {
  packages = [
    nodejs
    nodejs.pkgs.pnpm
    nodejs.pkgs.vercel
  ];

  shellHook = ''
    export PATH="$PWD/node_modules/.bin:$PATH"
  '';
}
