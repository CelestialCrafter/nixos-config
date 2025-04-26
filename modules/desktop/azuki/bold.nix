{
  lib,
  stdenvNoCC,
  fetchzip,
}:

stdenvNoCC.mkDerivation rec {
  pname = "azuki-font-bold";
  version = "1.20";

  src = fetchzip {
    url = "http://azukifont.com/font/azukifontB120.zip";
    sha256 = "sha256-pqlsqVuKcI1K/TowEd1qxNH/P5QoLrhvJNrUDHuX5ms=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts
    install -dm 755 $out/share/fonts/azuki-bold
    mv * $out/share/fonts/azuki-bold

    runHook postInstall
  '';

  meta = {
    description = "Azuki Font (Bold)";
    homepage = "http://azukifont.com";
    license = lib.licenses.gpl3Only;
    platforms = lib.platforms.linux;
  };
}
