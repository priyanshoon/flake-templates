{
  description = "nix flake-based development environment for C++ Programming";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];

      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              clang
              glibc.dev
            ];

            nativeBuildInputs = with pkgs; [
              clang-tools
            ];

            shellHook = ''
              export CC=clang
              export CXX=clang++

              cat > compile_flags.txt << EOF
              -std=c++17
              -isystem${pkgs.stdenv.cc.cc}/include/c++/${pkgs.stdenv.cc.cc.version}
              -isystem${pkgs.stdenv.cc.cc}/include/c++/${pkgs.stdenv.cc.cc.version}/x86_64-unknown-linux-gnu
              -isystem${pkgs.clang}/resource-root/include
              -isystem${pkgs.glibc.dev}/include        
              EOF

              echo "✓ Generated compile_flags.txt for clangd"
            '';
          };
        };
    };
}
