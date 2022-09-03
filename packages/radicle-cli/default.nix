{ lib, fetchzip, fetchFromGitHub, rustPlatform, pkg-config, openssl, cmake }:

rustPlatform.buildRustPackage rec {
  pname = "radicle-cli";
  version = "0.6.1";

  # src = fetchzip {
  #   url = "https://github.com/radicle-dev/${pname}/releases/download/v${version}/${pname}-x86_64-unknown-linux-musl.tar.gz";
  #   sha256 = "sha256-LaVMMIDxSGezW41MBFvfxBeBNqzDzFCKYBHiFfRH9pw";
  # };

  src = fetchFromGitHub {
    owner = "0xnook";
    repo = pname;
    rev = "6c916ec589bb18c067c30fbaf82c9b88fef60bbc";
    # sha256 = "sha256-LS6zYpMg0LanRL2M8ioGG8Ys07TPT/3hP7geEGehwxg=";
    sha256 = "sha256-O+wrn0oKre/WUFQpZ+Oxya0iRxZO80r8WfvWVRpsmP4=";
    # sha256 = lib.fakeHash;
  };

  # need cargoPatches since patches doesn't work with buildRustPackage
  # patches = [ ./diff-patch.patch ];
  # cargoPatches = [ ./diff-patch.patch ];

  postPatch = ''
    cat auth/src/lib.rs
  '';

  cargoHash = "sha256-PI3Ecn0QhWeRPSm8HUFK+tm4bqlehvIhjnckVCa6hh4=";
  # cargoHash = lib.fakeHash;

  nativeBuildInputs = [
    pkg-config
    cmake
  ];

  buildInputs = [
    openssl
  ];

  meta = with lib; {
    description = "Command-line tooling for Radicle";
    homepage = "https://radicle.network/";
    downloadPage = "https://github.com/radicle-dev/radicle-cli";
    license = licenses.gpl3Only;
    maintainers = [ maintainers.nook ];
  };
}
