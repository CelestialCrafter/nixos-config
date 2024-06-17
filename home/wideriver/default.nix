{ stdenv, lib, fetchFromGitHub, wayland, wayland-protocols, wlroots, pkg-config }:

stdenv.mkDerivation rec {
  pname = "wideriver";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "alex-courtis";
    repo = pname;
    rev = version;
    sha256 = "sha256-D1JHfMnq6u057FrBqgZ4UlfeOlkTWKkKzFYM29+vIJo=";
  };

  nativeBuildInputs = [ pkg-config wayland ];
  buildInputs = [ wayland-protocols wlroots ];

  makeFlags = [ "CC=${stdenv.cc.targetPrefix}cc" ];
  installFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "Tiling window manager for the river wayland compositor, inspired by dwm and xmonad";
    mainProgram = "wideriver";
    homepage = "https://github.com/alex-courtis/wideriver";
    license = with licenses; [ gpl3Only ];
    platforms = platforms.unix;
  };
}
