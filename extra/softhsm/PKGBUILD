# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=softhsm
pkgver=2.6.1
pkgrel=6
pkgdesc="Software PKCS#11 store"
arch=('x86_64')
url="https://opendnssec.readthedocs.io/en/latest/softhsm2/"
license=('BSD-2-Clause')
depends=('botan' 'sqlite3' 'openssl' 'p11-kit')
makedepends=('git')
checkdepends=('cppunit')
backup=("etc/softhsm2.conf")
options=(!libtool !lto)
source=("git+https://github.com/softhsm/SoftHSMv2.git#tag=$pkgver"
        "softhsm-openssl3-tests.patch"
        "softhsm-2.6.1-rh1831086-exit.patch")
sha256sums=('2d0995378e98cec51c67bdde6dad5a1a6fe03734c7d2567aac558affed05f0ad'
            'd97f51e8d41e8bf0ef2ee3959be746d0349e8e1c0130ddaf3d905c23f8e43230'
            '163338a73ab1bcc475e07b96f054d3c8f67ac9d2637b8f74ddaa97aa6b4171e1')

prepare() {
  cd "$srcdir/SoftHSMv2"
  patch -p1 -i "$srcdir/softhsm-openssl3-tests.patch"
  patch -p1 -i "$srcdir/softhsm-2.6.1-rh1831086-exit.patch"
  sed -i 's:^full_libdir=":#full_libdir=":g' configure.ac
  autoreconf -vfi
  sed -i "s:libdir)/@PACKAGE@:libdir):" Makefile.in
}

build() {
  cd "$srcdir/SoftHSMv2"
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/pkcs11 \
    --datarootdir=/usr/share \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --with-p11-kit=/usr/share/p11-kit/modules/ \
    --with-migrate \
    --enable-visibility \
    --enable-ecc \
    --enable-eddsa \
    --disable-gost
  make
}

check() {
  cd "$srcdir/SoftHSMv2"
  make check
}

package() {
  cd "$srcdir/SoftHSMv2"
  make DESTDIR="$pkgdir/" install
  install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/softhsm/LICENSE"
  rm "$pkgdir/etc/softhsm2.conf.sample"

  cd "$pkgdir/usr/lib"
  install -dm0755 softhsm
  ln -s ../pkcs11/libsofthsm2.so softhsm/
  ln -s pkcs11/libsofthsm2.so
}
