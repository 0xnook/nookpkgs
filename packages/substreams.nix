{ lib, stdenv, fetchFromGitHub, buildGoModule }:

let version = "1.7.3";
in buildGoModule {
  pname = "substreams";
  inherit version;

  src = fetchFromGitHub {
    owner = "streamingfast";
    repo = "substreams";
    rev = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-uognbqf0JfZoxG8MDdfqXiEPdKtyQ2rXbsaswBO9Uro=";
  };

  vendorHash = "sha256-fpHv2RRW3wXsxUiferjZ5c31dQPGd/8gqGDXr/Nc4/c=";
  subPackages = [ "cmd/substreams" ];

  meta = with lib; {
    homepage = "https://github.com/streamingfast/substreams";
    description = "TODO";
    license = licenses.asl20;
    maintainers = with maintainers; [ nook ];
  };
}
