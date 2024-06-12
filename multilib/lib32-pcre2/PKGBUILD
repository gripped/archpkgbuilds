# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=lib32-pcre2
_name="${pkgname#lib32-}"
pkgver=10.44
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version (32-bit)'
arch=(x86_64)
url='https://github.com/PhilipHazel/pcre2'
license=(BSD-3-Clause)
depends=(lib32-glibc "$_name=$pkgver")
provides=(libpcre2-{8,16,32,posix}.so)
source=(
  $url/releases/download/$_name-$pkgver/$_name-$pkgver.tar.bz2{,.sig}
  $pkgname-10.44-32bit_test_offset.patch
)
sha512sums=('ee91cc10a2962bc7818b03d368df3dd31f42ea9a7260ae51483ea8cd331b7431e36e63256b0adc213cc6d6741e7c90414fd420622308c0ae3fcb5dd878591be2'
            'SKIP'
            '3a19133506efaa6c22973a42d5499ecb5f8250bd422044a7d55ce39ec9b2b337c9d7fe0cb39d4735d9be1e8f46bb2ef96b25988284d6b3e9f5b2609f8f7affd4')
b2sums=('fb06228f8bdc5906ef4f19d7d677f1009070855149d9ad3f807cfcd164f5cb6165f96e074fedc3942226d4b29edf4b29fab6cde2f2ba58bf6da282730941412b'
        'SKIP'
        '062bd941334ab4a3649080646966912d7fb1271ce167cf1edc01dfa7adae9c20c26c610a56561c3907fdc2da6ab809a2e6f09a37757f1a5cf39549a0a6062de4')
validpgpkeys=(45F68D54BBE23FB3039B46E59766E084FB0F43D8)  # Philip Hazel <ph10@hermes.cam.ac.uk>

prepare() {
  # fix issues with offset in tests (i686 specific): https://github.com/PCRE2Project/pcre2/issues/415
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-10.44-32bit_test_offset.patch
}

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
