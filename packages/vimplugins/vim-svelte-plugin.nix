{ vimUtils, fetchFromGitHub }:

vimUtils.buildVimPlugin {
  name = "vim-svelte-plugin";
  src = fetchFromGitHub {
    owner = "leafOfTree";
    repo = "vim-svelte-plugin";
    rev = "81fdbd57f5e60c2654249c1bbc3072720eeaa27f";
    hash = "sha256-hstEInKVFra1g47p6wKA7uCDBwXpoZ3iJz/ZaRjB34Q=";
  };
}
