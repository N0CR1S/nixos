{ inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = { inherit inputs; };

    users.john = import ../home/john.nix;
  };
}
