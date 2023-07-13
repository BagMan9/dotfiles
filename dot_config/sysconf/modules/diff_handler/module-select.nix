# Stolen from https://github.com/reckenrode/nixos-configs/blob/main/modules/top-level/all-modules.nix
# Author reckenrode, modified by me

{ lib }:

let
  inherit (builtins) readDir;

  inherit (lib) attrNames concatMap elemAt filter filterAttrs pathExists substring toLower foldl';
  inherit (lib.trivial) pipe;

  enumerateModules = { prefix ? "", basePath }:
    let
      childPaths = path: attrNames (filterAttrs (_: type: type == "directory") (readDir path));

      isShardedCorrectly = path: elemAt path 0 == toLower (substring 0 2 (elemAt path 1));

      mkPath = shard: package: [ shard package "${prefix}module.nix" ];

      modulesInShard = shard: map (mkPath shard) (childPaths (basePath + "/${shard}"));

      renderPath = foldl' (path: elem: path + "/${elem}");
    in
    pipe (childPaths basePath) [
      (concatMap modulesInShard)
      (filter isShardedCorrectly)
      (map (renderPath basePath))
      (filter pathExists)
    ];

  allModules = enumerateModules { basePath = ../module_confs; };
in
{
  darwin = allModules ++ enumerateModules { prefix = "darwin-"; basePath = ../module_confs; };
  nixos = allModules ++ enumerateModules { prefix = "nixos-"; basePath = ../module_confs; };
  home = enumerateModules { prefix = "hm-"; basePath = ../module_confs; };
}
