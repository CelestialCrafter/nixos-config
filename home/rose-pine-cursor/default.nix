{ lib
, stdenvNoCC
, fetchurl
, gtk3
}:

stdenvNoCC.mkDerivation rec {
  pname = "rose-pine-cursor";
  version = "1.1.0";

  src = fetchurl {
    url = "https://github.com/rose-pine/cursor/releases/download/v1.1.0/BreezeX-RosePine-Linux.tar.xz";
    sha256 = "sha256-szDVnOjg5GAgn2OKl853K3jZ5rVsz2PIpQ6dlBKJoa8=";
  };

  nativeBuildInputs = [
    gtk3
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/icons
    install -dm 755 $out/share/icons/rose-pine-cursor
    mv * $out/share/icons/rose-pine-cursor

    gtk-update-icon-cache $out/share/icons/rose-pine-cursor
 
    runHook postInstall
  '';

  meta = {
    description = "Soho vibes for Cursors";
    homepage = "https://github.com/rose-pine/cursor";
    license = lib.licenses.gpl3Only;
    platforms = lib.platforms.linux;
  };
}
