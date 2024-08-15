# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

_pkgbasename=fakeroot
pkgname=lib32-${_pkgbasename}
pkgver=1.35.1
pkgrel=1
pkgdesc='Tool for simulating superuser privileges (32-bit)'
arch=('x86_64')
license=('GPL')
url="https://tracker.debian.org/pkg/fakeroot"
install=fakeroot.install
depends=('lib32-glibc' "$_pkgbasename")
makedepends=('po4a')
source=("https://deb.debian.org/debian/pool/main/f/${_pkgbasename}/${_pkgbasename}_${pkgver}.orig.tar.gz"
        '0001-Cast-uint8_t-pointers.patch')
sha512sums=('fae7d619d65e0a554c40b2e98ae0f81c92c75f6cc2ac9b5060c312e2080ed4be7691ebe8328e2980efb3516e2d5ecf44f17dd56d7e7c61b543f3e888405307bf'
            '9ecaefce3cd49f261665054e477478a0a9773b41389293031fd9ec977f12c46a44bb3781f278b196b18fa6a4d4f3259bafb8c995b687d54590c68bb697517a0c')

prepare() {
  cd "${_pkgbasename}-${pkgver}"

  patch -Np1 < ../0001-Cast-uint8_t-pointers.patch
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${_pkgbasename}-${pkgver}"
  ./bootstrap
  ./configure --prefix=/usr --libdir=/usr/lib32/libfakeroot \
              --disable-static --with-ipc=sysv
  make

  cd doc
  po4a -k 0 --rm-backups --variable "srcdir=../doc/" po4a/po4a.cfg
}

package() {
  cd "${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,share}

  install -dm0755 "${pkgdir}/etc/ld.so.conf.d/"
  echo '/usr/lib32/libfakeroot' > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
}
