{
  description = "personal nix flake template for devenv";
  outputs =
    { self }:
    {
      templates = {
        c = {
          path = ./c;
          description = "C project environment";
        };
        cpp = {
          path = ./cpp;
          description = "Cpp project environment";
        };

        python-postgresql = {
            path = ./python-postgresql;
            description = "python & postgresql development environment";
        };
      };
    };
}
