{ pkgs ? import <nixpkgs> {} }:

let
  pname = "frame";
  version = "0.5.0-beta.18";
  name = "${pname}-${version}";
  src = pkgs.fetchurl {
    url = "https://github.com/floating/frame/releases/download/v${version}/Frame-${version}.AppImage";
    sha256 = "sha256-4bS5lGksSqJ60t9k8ihd3oLYNquTYrDpiNRUtEZHbXw=";
  };
  
  appimageContents = pkgs.appimageTools.extractType2 {
    inherit name src;
  };
in
  pkgs.appimageTools.wrapType2 { 
    inherit name src;



  extraInstallCommands = ''
    ln -s $out/bin/${name} $out/bin/${pname}
    install -m 444 -D ${appimageContents}/frame.desktop $out/share/applications/frame.desktop
    install -m 444 -D ${appimageContents}/frame.png \
      $out/share/icons/hicolor/512x512/apps/frame.png
    substituteInPlace $out/share/applications/frame.desktop \
      --replace 'Exec=AppRun' 'Exec=${pname}'
  '';

  extraPkgs = pkgs: with pkgs; [ ];
}
