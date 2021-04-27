{
  description = "A very basic flake";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {inherit system;};
      in
    {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;
    devShell."${system}" = pkgs.mkShell {
      nativeBuildInputs = with pkgs; [cmake openssl python3 ninja pkg-config];
    };
  };
}
