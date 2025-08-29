# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=lib32-pcre2
_name="${pkgname#lib32-}"
pkgver=10.46
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
sha512sums=('0adb31a8db7fbe33af3155ffccc117cbf604ac290fbbc5087638497dd7d22ab30b493dad7a0d9d3532980cf56ca76fc992b0e279d8ff641e9f9a31a1e28ef9a8'
            'SKIP')
b2sums=('499d16dc44df9f2d352e3f954f576369cc7a11018e46d96ec24f33ffba6eec55b670fd5437b02a013db1c8f63612ebfaafb87a2d762a1f9c8ba271ef3727f1d5'
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
