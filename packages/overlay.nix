final: prev: {
  nookpkgs.vimPlugins.vim-svelte-plugin = prev.callPackage ./vimplugins/vim-svelte-plugin.nix {};
  nookpkgs.newaita-reborn = prev.callPackage ./newaita-reborn.nix {};
  nookpkgs.radicle-cli = prev.callPackage ./radicle-cli {};
}
