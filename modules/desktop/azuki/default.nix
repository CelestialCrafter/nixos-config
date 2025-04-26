{
  lib,
  stdenvNoCC,
  fetchzip,
}:

stdenvNoCC.mkDerivation rec {
  pname = "azuki-font";
  version = "1.21";

  src = fetchzip {
    url = "http://azukifont.com/font/azukifont121.zip";
    sha256 = "sha256-mw2dgvzAX9k2vEmuHtH3enAl3Zs7aLdUcWEczdaaxrw=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts
    install -dm 755 $out/share/fonts/azuki
    mv * $out/share/fonts/azuki

    runHook postInstall
  '';

  meta = {
    description = "Azuki Font";
    homepage = "http://azukifont.com";
    license = lib.licenses.gpl3Only;
    platforms = lib.platforms.linux;
  };
}
