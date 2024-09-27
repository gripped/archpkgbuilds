# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=libcupsfilters
pkgver=2.0.0
pkgrel=3
pkgdesc="OpenPrinting CUPS Filters - contains all the code of the filters of the former cups-filters package as library functions"
arch=('x86_64')
url="https://github.com/OpenPrinting/libcupsfilters"
license=('Apache-2.0 WITH LLVM-exception')
depends=('libcups' 'libexif' 'qpdf' 'poppler'
         'libjpeg-turbo' 'libpng' 'libtiff' 'lcms2' 'fontconfig' 'glibc' 'gcc-libs' 'dbus')
makedepends=(
	'ghostscript' 
#        'mupdf-tools' ???
)
checkdepends=('ttf-dejavu') # ttf-dejavu for make check
source=("https://github.com/OpenPrinting/libcupsfilters/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
        CVE-2024-47076.patch)
sha256sums=('542f2bfbc58136a4743c11dc8c86cee03c9aca705612654e36ac34aa0d9aa601'
            'c3d24aacad3c5641c12a4371697cc6ca602e30604aa79ab2a061f1c8bbb65cf7')

prepare() {
  cd "$pkgname"-$pkgver
  # The destination can be corrupted or forged, so validate the response
  # to strenghten security measures.
  patch -Np1 -i ../CVE-2024-47076.patch
}

build() {
  cd "$pkgname"-$pkgver
  ./configure --prefix=/usr  \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-mutool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "$pkgname"-$pkgver
  make check
}

package() {
  cd "$pkgname"-$pkgver
  make DESTDIR="$pkgdir/" install
  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/${pkgname}-${pkgver}/{COPYING,NOTICE} "${pkgdir}"/usr/share/licenses/${pkgname}/
}
