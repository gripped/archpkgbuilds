# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=libmodplug
pkgver=0.8.9.2
pkgrel=1
pkgdesc="A MOD playing library"
arch=('x86_64')
url="https://github.com/Konstanty/libmodplug"
license=('LicenseRef-PublicDomain')
depends=('glibc' 'libstdc++')
makedepends=('git')
source=(git+https://github.com/Konstanty/libmodplug.git#tag=v${pkgver}
        libmodplug-0.8.9.0-no-fast-math.patch)
sha256sums=('cf35b5b5a9b504a7fbf3d5b28fb096e2e9d015a20c9cebec372c41c7d6bd277f'
            '24b97252803b39546199715158ab1d61616755c6c9756f8b2b9b1948477ce4ed')

prepare() {
  cd ${pkgname}
  # Avoid invalid floating-point operations in consumers (FS#76950).
  patch -Np1 -i ../libmodplug-0.8.9.0-no-fast-math.patch
  autoreconf -vfi
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
