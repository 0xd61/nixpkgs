{ lib, stdenv, fetchurl, pkg-config, cmake, libgsf, glib, libxml2 }:

stdenv.mkDerivation rec {
  pname = "wv2";
  version = "0.4.2";
  src = fetchurl {
    url = "mirror://sourceforge/wvware/wv2-${version}.tar.bz2";
    sha256 = "1p1qxr8z5bsiq8pvlina3c8c1vjcb5d96bs3zz4jj3nb20wnsawz";
  };

  patches = [ ./fix-include.patch ];

  nativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [ libgsf glib libxml2 ];

  NIX_CFLAGS_COMPILE = "-I${libxml2.dev}/include/libxml2";

  meta = {
    description = "Excellent MS Word filter lib, used in most Office suites";
    license = lib.licenses.lgpl2;
    homepage = "https://wvware.sourceforge.net";
  };
}
