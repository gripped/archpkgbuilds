# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=libarchive
pkgver=3.7.3
pkgrel=1
pkgdesc='Multi-format archive and compression library'
arch=('x86_64')
url='https://libarchive.org/'
license=('BSD')
depends=('acl' 'libacl.so' 'bzip2' 'expat' 'lz4' 'openssl' 'libcrypto.so' 'xz'
         'zlib' 'zstd')
provides=('libarchive.so')
validpgpkeys=('A5A45B12AD92D964B89EEE2DEC560C81CEC2276E'  # Martin Matuska <mm@FreeBSD.org>
              'DB2C7CF1B4C265FAEF56E3FC5848A18B8F14184B') # Martin Matuska <martin@matuska.org>
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('63e7a7174638fc7d6b79b4c8b0ad954e0f4f45abe7239c1ecb200232aa9a43d2'
            'SKIP')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
      --prefix=/usr \
      --without-xml2 \
      --without-nettle \
      --disable-static
  make
}

check() {
  cd "${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/libarchive/COPYING"
}
