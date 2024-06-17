{ lib, rustPlatform, fetchFromGitLab }:

rustPlatform.buildRustPackage rec {
  pname = "ristate";
  version = "unstable-2021-09-10";

  src = fetchFromGitLab {
    owner = "snakedye";
    repo = pname;
    rev = "92e989f26cadac69af1208163733e73b4cf447da";
    sha256 = "sha256-6slH7R6kbSXQBd7q38oBEbngaCbFv0Tyq34VB1PAfhM=";
  };

  cargoSha256 = "sha256-fOo9C0dNL9dYy5wXq/yEDqOV0OhOTEY42XK8ShpQh6k=";

  meta = with lib; {
    description = "River-status client written in Rust";
    homepage = "https://gitlab.com/snakedye/ristate";
    license = licenses.mit;
    mainProgram = "ristate";
  };
}
