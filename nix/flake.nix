{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{
    self,
    nix-darwin,
    nixpkgs,
    nixpkgs-unstable
  }:
  let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake ~/.config/nix
    # $ darwin-rebuild switch --flake ~/.config/nix
    darwinConfigurations."boltless-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [
        ./darwin.nix
      ];
      specialArgs = {
        inherit self pkgs-unstable;
      };
    };
    # based on https://zaynetro.com/post/2024-you-dont-need-home-manager-nix
    # $ nix profile install .
    # $ nix profile upgrade nix
    packages.${system}.default = pkgs.buildEnv {
      name = "my-env";
      paths = [
        pkgs.anki-bin
        pkgs.bacon
        pkgs.btop
        pkgs.dust
        pkgs.eza
        pkgs.fd
        pkgs.gh
        pkgs.hello
        pkgs.janet
        pkgs.meld
        pkgs.nodejs_23
        pkgs.ripgrep
        pkgs.sumneko-lua-language-server
        pkgs.unixtools.watch
        pkgs-unstable.jujutsu
        pkgs-unstable.neovim
        # TODO: automate this with nix:
        # $ ln -sfn ~/.nix-profile/Applications ~/Applications/Nix\ User\ Apps
      ];
    };
  };
}
# vim: et:ts=2
