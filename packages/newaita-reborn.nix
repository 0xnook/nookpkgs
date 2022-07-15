{ lib, stdenv, fetchFromGitHub, gtk3, gnome, gnome-icon-theme, hicolor-icon-theme }:

stdenv.mkDerivation rec {
  pname = "Newaita-reborn";
  # what is the nix way to deal with unversioned packages?
  version = "2020-03-18"; 

  src = fetchFromGitHub {
    owner = "cbrnix";
    repo = pname;
    rev = "5b19f46a4ca918585038547b27810502a5997401";
    sha256 = "sha256-nA0l+xH9BlxID0lsXkojKvQRZgkJulSWsRinDre0oW8=";
  };

  nativeBuildInputs = [
    gtk3
  ];

  propagatedBuildInputs = [
    gnome.adwaita-icon-theme
    gnome-icon-theme
    hicolor-icon-theme
  ];

  # make sure cache file is not removed by the gtk3 setup hook.
  dontDropIconThemeCache = true;

  # These fixup steps are slow and unnecessary for this package
  dontPatchELF = true;
  dontRewriteSymlinks = true;

  installPhase = ''
    mkdir -p $out/share/icons
    mv Newaita-reborn* $out/share/icons

    # update cache
    for theme in $out/share/icons/*; do
      gtk-update-icon-cache --force $theme
    done
  '';

  meta = with lib; {
    description = "Remaster Newaita icon theme. Refreshed and made cleaner";
    homepage = "https://github.com/cbrnix/Newaita-reborn";
    license = [ licenses.gpl3Only ];
    # darwin cannot deal with file names differing only in case
    platforms = platforms.linux;
    maintainers = with maintainers; [ nook ];
  };
}
