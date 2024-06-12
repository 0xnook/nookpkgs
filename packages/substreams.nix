{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

let
  version = "1.7.3";
in
buildGoModule {
  pname = "substreams";
  inherit version;

  src = fetchFromGitHub {
    owner = "streamingfast";
    repo = "substreams";
    rev = "v${version}";
    hash = lib.fakehash;
  };

  vendorSha256 = "sha256-mLdAaYkQH2RHcZft27rDW1AoFCWKiUZhh2F0DpqZELw=";

  meta = with lib; {
    homepage = "https://github.com/streamingfast/substreams";
    description = "TODO";
    license = licenses.asl20;
    maintainers = with maintainers; [ nook ];
  };
}