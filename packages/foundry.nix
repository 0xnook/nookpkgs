{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "foundry";
  version = "nightly-2022.09.05";

  src = fetchFromGitHub {
    owner = "foundry-rs";
    repo = pname;
    rev = "6f7866d822eec03bc2be45204c714fbed2024522";
    sha256 = "sha256-qZk7o5mCm8pW4HuXGQExMOSp36uOhMKi3XxOdiqC5yE=";
  };

  cargoPatches = [ ./dup-dep.patch ];

  # cargoSha256 = lib.fakeHash;
  cargoSha256 = "sha256-IfuEqo5z+K+XbDSFgDIycpOLiBeB9iCz/sj8i+lB8dw=";

  meta = with lib; {
    description = "Foundry is a blazing fast, portable and modular toolkit for Ethereum application development";
    homepage = "https://getfoundry.sh/";
    downloadPage = "https://github.com/foundry-rs/foundry/releases";
    license = licenses.asl20;
    maintainers = [ maintainers.nook ];
  };
}
