# joplin-flake
---------
##  Installation
### Add this repo's flake to your flake inputs
```
# flake.nix
{
  # ...
  inputs = {
    joplin-desktop = {
      type = "github";
      owner = "tr3nb0lone";
      repo = "joplin-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  # ...
}
```

## Installing the package provided by the flake
### You can install it with either `environment.systemPackages` or `home.packages`
> With `environment.systemPackages` (nixosModules)

  ```nix
    { inputs, ... }: {
      environment.systemPackages = [
        inputs.joplin-desktop.packages.${system}.default
      ];
    }
  ```

> With `home.packages` (home-manager)
 ```nix
    { inputs, ... }: {
      home.packages = [
        inputs.joplin-desktop.packages.${system}.default
      ];
    }
  ```
