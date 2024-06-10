# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

_pkgbasename=fakeroot
pkgname=lib32-${_pkgbasename}
pkgver=1.35
pkgrel=1
pkgdesc='Tool for simulating superuser privileges (32-bit)'
arch=('x86_64')
license=('GPL')
url="https://tracker.debian.org/pkg/fakeroot"
install=fakeroot.install
depends=('lib32-glibc' "$_pkgbasename")
makedepends=('po4a')
source=("https://deb.debian.org/debian/pool/main/f/${_pkgbasename}/${_pkgbasename}_${pkgver}.orig.tar.gz")
sha512sums=('2a83af4d2258e12b70af0c9a30ce954c04263fc1c2ccadf42cd92736c9b83b12e07afa31390b15956dd447a0e7269cc86b84def4b0d87009554edeaa6c5a0a19')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}-${pkgver}
  ./bootstrap
  ./configure --prefix=/usr --libdir=/usr/lib32/libfakeroot \
              --disable-static --with-ipc=sysv
  make

  cd doc
  po4a -k 0 --rm-backups --variable "srcdir=../doc/" po4a/po4a.cfg
}

package() {
  cd ${_pkgbasename}-${pkgver}
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/{bin,share}

  install -dm0755 "$pkgdir"/etc/ld.so.conf.d/
  echo '/usr/lib32/libfakeroot' > "$pkgdir"/etc/ld.so.conf.d/$pkgname.conf
}
