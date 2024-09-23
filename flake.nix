{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    pyproject-nix = {
      url = "github:nix-community/pyproject.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, flake-utils, pyproject-nix, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            (
              pkgs.python3.pkgs.buildPythonApplication
                (
                  (pyproject-nix.lib.renderers.buildPythonPackage {
                    project = (pyproject-nix.lib.project.loadPoetryPyproject {
                      projectRoot = (pkgs.fetchFromGitHub {
                        owner = "cruft";
                        repo = "cruft";
                        rev = "2.15.0";
                        hash = "sha256-qIVyNMoI3LsoOV/6XPa60Y1vTRvkezesF7wF9WVSLGk=";
                      });
                    });
                    python = pkgs.python3;
                  }) #// {
                  #                      version = "v0.13.4";
                  # build-system = [
                  #   pkgs.python3.pkgs.setuptools
                  #   pkgs.python3.pkgs.setuptools-scm
                  # ];
                  # }
                )

            )
            pkgs.go
            pkgs.unzip
          ];
        };
      });
}
