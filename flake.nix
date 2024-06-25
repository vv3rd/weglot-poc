{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { utils, nixpkgs, ... }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
      node = pkgs.nodejs;
      pnpm = node.pkgs.pnpm;

      # app = pkgs.mkDerivation {
      #   name = "rsn-poc";
      #   buildInputs = [node pnpm];
      #   buildPhase = ''
      #     pnpm i --frozen-lockfile
      #     pnpm run build
      #   '';
      #   installPhase = ''
      #     cp -r dist $out/
      #   '';
      # };
    in
    {
      packages = { };

      devShell = pkgs.mkShell {
        packages = [
          node
          pnpm
        ];

        shellHook = ''
          export PATH="$PWD/node_modules/.bin:$PATH"
        '';
      };
    });
}
