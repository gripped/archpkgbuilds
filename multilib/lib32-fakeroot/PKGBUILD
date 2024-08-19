# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

_pkgbasename=fakeroot
pkgname=lib32-${_pkgbasename}
pkgver=1.36
pkgrel=1
pkgdesc='Tool for simulating superuser privileges (32-bit)'
arch=('x86_64')
license=('GPL-3.0-or-later')
url="https://tracker.debian.org/pkg/fakeroot"
install=fakeroot.install
depends=('lib32-glibc' "$_pkgbasename")
makedepends=('git' 'po4a')
source=("git+https://salsa.debian.org/clint/fakeroot.git#tag=upstream/${pkgver}")
sha512sums=('532553727c842a7c65ace8ae0be356b6aaa91228ce1c7c415f9e4a09ae7b05e4b2a857c84f2c9ce71c974a63aae8ceb48f118f1ab2b18a6e1fb0cc40392333b1')
prepare() {
  cd "${_pkgbasename}"

  autoreconf -fi
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${_pkgbasename}"

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32/libfakeroot \
    --disable-static \
    --with-ipc=sysv
  make

  cd doc
  po4a -k 0 --rm-backups --variable "srcdir=../doc/" po4a/po4a.cfg
}

package() {
  cd "${_pkgbasename}"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,share}

  install -dm0755 "${pkgdir}/etc/ld.so.conf.d/"
  echo '/usr/lib32/libfakeroot' > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
}
