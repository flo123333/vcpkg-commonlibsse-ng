# Color-Glass Studios Vcpkg Repository
This is a repository of Color-Glass software and related third-party libraries for use with Vcpkg.

## Use in Manifest Mode
To add to your project create a file in the root of your project (next to `vcpkg.json`) called
`vcpkg-configuration.json`. Add the following to that file:

```json
{
  "registries": [
    {
      "kind": "git",
      "repository": "https://gitlab.com/colorglass/vcpkg-colorglass",
      "baseline": "70edd3a6927bb508e8fa06f55c750a86e407a065",
      "packages": [
        "articuno",
        "bethesda-fallout4-scripts",
        "bethesda-skyrim-scripts",
        "commonlibf4"
        "commonlibsse",
        "commonlibvr",
        "f4se",
        "fully-dynamic-game-engine",
        "gluino",
        "script-extender-common",
        "skse",
        "tsl-hat-trie"  
      ]
    }
  ]
}
```

Any packages that will not be used can be removed from the packages list. If you already have a
`vcpkg-configuration.json` file you can add the registry definition to your existing registries list.

## Use in Classic Mode
To use the registry in classic mode is identical to using it in manifest mode, however the `vcpkg-configuration.json`
file to use will be located in your Vcpkg root directory rather than your project directory.

## Available Packages
* `articuno`: A next-generation, high-performance, feature-rich serialization framework for C++20 and later.
* `bethesda-fallout4-scripts`: Papyrus script sources for Bethesda's Fallout 4 game, installed locally for Papyrus development.
* `bethesda-skyrim-scripts`: Papyrus script sources for Bethesda's Skyrim Special Edition game, installed locally for Papyrus development.
  Requires Skyrim Special Edition to be installed on the local machine.
* `commonlibf4`: Library of reverse engineered functionality for Fallout 4 (does not currently build).
* `commonlibsse`: Library of reverse engineered functionality for Skyrim Special Edition.
* `commonlibvr`: Library of reverse engineered functionality for Skyrim VR (does not currently build).
* `f4se`: The Fallout 4 script extender; this package can build the F4SE DLL (currently does not build), as well as install Papyrus script
  sources locally for Papyrus Development.
* `fully-dynamic-game-engine`: A framework from the Skyrim NG project enabling next-generation modding capabilities for Skyrim Special Edition.
* `gluino`: A modern general utility header-only library for C++20 and later development.
* `script-extender-common`: A library used by SKSE and F4SE.
* `skse`: The Skyrim Special Edition Script extender; this package can build the SKSE64 DLL (currently does not build), as well as install Papyrus
  script sources locally for Papyrus development.
* `tsl-hat-trie`: A highly efficient trie implementation.
