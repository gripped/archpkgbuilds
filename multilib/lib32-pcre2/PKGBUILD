# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=lib32-pcre2
_name="${pkgname#lib32-}"
pkgver=10.43
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version (32-bit)'
arch=(x86_64)
url='https://github.com/PhilipHazel/pcre2'
license=(BSD-3-Clause)
depends=(lib32-glibc "$_name=$pkgver")
provides=(libpcre2-{8,16,32,posix}.so)
source=($url/releases/download/$_name-$pkgver/$_name-$pkgver.tar.bz2{,.sig})
sha512sums=('8ac1520c32e9e5672404aaf6104e23c9ee5c3c28ad28ff101435599d813cbb20e0491a3fd34e012b4411b3e0366a4c6dfa3f02d093acaa6ff0ab25478bb7ade9'
            'SKIP')
b2sums=('f87f9f36dd6a806cdba1f077f51b53da2583f1898f83e41d594622b28ac8efbc1b2d122b752a9d6cd461fe0e3c7c85ee93358443df518a336da4ee9d72cca808'
        'SKIP')
validpgpkeys=(45F68D54BBE23FB3039B46E59766E084FB0F43D8)  # Philip Hazel <ph10@hermes.cam.ac.uk>

build() {
  local configure_options=(
    --disable-pcre2grep-libbz2
    --disable-pcre2grep-libz
    --disable-pcre2test-libreadline
    --enable-jit
    --enable-pcre2-16
    --enable-pcre2-32
    --libdir=/usr/lib32
    --prefix=/usr
  )

  cd $_name-$pkgver

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  ./configure "${configure_options[@]}"
  make
}

check() {
  make -j1 check -C $_name-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install -C $_name-$pkgver

  rm -rv "$pkgdir"/usr/{bin,share,include}

  install -vDm644 $_name-$pkgver/LICENCE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set sw=2 sts=-1 et:
