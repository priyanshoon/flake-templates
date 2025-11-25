# Flake Templates

This is my repo for nix flake templates for various project.

## C Development Environment
```sh
mkdir my-app
cd my-app
nix flake init -t github:priyanshoon/flake-templates#c
```

## some various useful commands
```sh
nix flake show github:priyanshoon/flake-templates
nix flake metadata github:priyanshoon/flake-templates --refresh
```
