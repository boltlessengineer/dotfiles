{
  lib,
  stdenv,
  fetchurl,
  undmg
}:

stdenv.mkDerivation {
  pname = "orion-browser";
  version = "0.99.133.2.1";
  src = fetchurl {
    url = "https://cdn.kagi.com/downloads/OrionInstaller.dmg";
    sha256 = "sha256-YddrLiv6hD8Lge4B8hsA4Cu2Fv/ap5rqw2KSx3JxC+E=";
  };
  sourceRoot = ".";
  buildInputs = [ undmg ];
  installPhase = ''
    runHook preInstall

    mkdir -p "$out/Applications"
    cp -r *.app "$out/Applications"

    runHook postInstall
  '';
  meta = {
    homepage = "https://kagi.com/orion/";
    platforms = lib.platforms.darwin;
  };
}
