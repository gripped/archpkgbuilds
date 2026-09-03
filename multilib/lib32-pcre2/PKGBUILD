# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=lib32-pcre2
_name="${pkgname#lib32-}"
pkgver=10.48
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version (32-bit)'
arch=(x86_64)
url='https://github.com/PCRE2Project/pcre2'
license=(
  BSD-2-Clause
  'BSD-3-Clause WITH PCRE2-exception'
)
depends=(
  lib32-glibc
  "$_name=$pkgver"
)
makedepends=(
  git
  lib32-bzip2
  lib32-readline
  lib32-zlib
)
provides=(libpcre2-{8,16,32,posix}.so)
source=(
  $_name::git+$url?signed#tag=$_name-$pkgver
  sljit::git+https://github.com/zherczeg/sljit.git
)
sha512sums=('977bad96974389540e113e7fc2bf3cb4b522b0059faed3e6040ad0ac1345e1214fdf678d2eb0462bcd1ae27d5655c5c598b5871d70757c54864b280ea0c1adb2'
            'SKIP')
b2sums=('3eb12ed75d9d2b9acdb53531b01a883ace3f7d9b5226370e0ec73a23ce4246c53c4217f00dd0eb9ccd9b0451856d1f9d827b6c92552c4e3ae8c18db47e996341'
        'SKIP')
validpgpkeys=(
  45F68D54BBE23FB3039B46E59766E084FB0F43D8  # Philip Hazel <ph10@hermes.cam.ac.uk>
  A95536204A3BB489715231282A98E77EB6F24CA8  # Nicholas Wilson <nicholas@nicholaswilson.me.uk>
)

prepare() {
  cd $_name

  git submodule init
  git config submodule."deps/sljit".url ../sljit
  git -c protocol.file.allow=always submodule update

  ./autogen.sh

  # extract licenses
  cp -v deps/sljit/LICENSE ../BSD-2-Clause.txt
  sed -n '70,94p' LICENCE.md > ../BSD-3-Clause.txt
  sed -n '100,104p' LICENCE.md > ../PCRE2-exception.txt
}

build() {
  local configure_options=(
    --enable-jit
    --enable-pcre2-16
    --enable-pcre2-32
    --enable-pcre2grep-libbz2
    --enable-pcre2grep-libz
    --enable-pcre2test-libreadline
    --libdir=/usr/lib32
    --prefix=/usr
  )

  cd $_name

  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure "${configure_options[@]}"
  make
}

check() {
  make -j1 check -C $_name
}

package() {
  make DESTDIR="$pkgdir" install -C $_name

  rm -rv "$pkgdir"/usr/{bin,share,include}

  install -Dm644 ./*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set sw=2 sts=-1 et:
