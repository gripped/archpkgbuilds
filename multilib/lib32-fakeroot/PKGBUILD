# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

_pkgbasename=fakeroot
pkgname=lib32-${_pkgbasename}
pkgver=1.33
pkgrel=1
pkgdesc='Tool for simulating superuser privileges (32-bit)'
arch=('x86_64')
license=('GPL')
url="https://tracker.debian.org/pkg/fakeroot"
install=fakeroot.install
depends=('lib32-glibc' "$_pkgbasename")
makedepends=('po4a')
source=("https://deb.debian.org/debian/pool/main/f/${_pkgbasename}/${_pkgbasename}_${pkgver}.orig.tar.gz")
sha512sums=('f87b85531fc5af4ff24a6e27a5b7a25f7d220672fb0b0b925554b0138f3cff7ff7920ce96ed77313a7fb55656a313dc07b58c2935be262091405e509fdcbec03')

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
