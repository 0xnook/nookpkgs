final: prev: {
  nookpkgs.frame = prev.callPackage ./frame.nix {};
  nookpkgs.vimPlugins.vim-svelte-plugin = prev.callPackage ./vimplugins/vim-svelte-plugin.nix {};
  nookpkgs.newaita-reborn = prev.callPackage ./newaita-reborn.nix {};
}
