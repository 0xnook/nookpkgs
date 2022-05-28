final: prev: {
	nookpkgs.frame = prev.pkgs.callPackage ./frame.nix {};
	nookpkgs.vimPlugins.vim-svelte-plugin = prev.pkgs.callPackage ./vimplugins/vim-svelte-plugin.nix {};
}
