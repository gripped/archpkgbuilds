# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

_pkgbasename=fakeroot
pkgname=lib32-${_pkgbasename}
pkgver=1.37.1
pkgrel=1
pkgdesc='Tool for simulating superuser privileges (32-bit)'
arch=('x86_64')
license=('GPL-3.0-or-later')
url="https://tracker.debian.org/pkg/fakeroot"
install=fakeroot.install
depends=('lib32-glibc' "$_pkgbasename")
makedepends=('git' 'po4a')
source=("git+https://salsa.debian.org/clint/fakeroot.git#tag=upstream/${pkgver}")
sha512sums=('2c6ef978cc6a10703e1d4320c1a72eb03dfd3b408fe3e7a9ae95f403d758b2becaa6ac6ddfcf5533bbaac86e16dea681a7f9d405485ac7d59a6f94d38e061c40')
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
