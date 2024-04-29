{ lib
, fetchPypi
, buildPythonPackage
, pillow
}:

buildPythonPackage rec {
  pname = "colorthief";
  version = "0.2.1";
  format = "setuptools";

  # PyPi release does not contain test files, but the repo has no release tags,
  # so while having no tests is not ideal, follow the PyPi releases for now
  # TODO: switch to fetchFromGitHub once this issue is fixed:
  # https://github.com/rsalmei/about-time/issues/15
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-B5ywyVvdZpxGQ+L3SU3hOwtgKdXNvi101dPDOGvVciE=";
  };

  propagatedBuildInputs = [
    pillow
  ];

  doCheck = false;

  pythonImportsCheck = [
    "colorthief"
  ];

  meta = with lib; {
    description = "A module for grabbing the color palette from an image.";
    homepage = "https://github.com/fengsp/color-thief-py";
    license = licenses.mit;
    maintainers = with maintainers; [ thiagokokada ];
  };
}
