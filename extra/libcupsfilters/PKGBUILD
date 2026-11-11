# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=libcupsfilters
pkgver=2.2.1.r80.ge1dde819
_commit=e1dde819ca1f0514818f51c82640687263cec34d # master 2026-11-07
pkgrel=1
pkgdesc="OpenPrinting CUPS Filters - contains all the code of the filters of the former cups-filters package as library functions"
arch=('x86_64')
url="https://github.com/OpenPrinting/libcupsfilters"
license=('Apache-2.0 WITH LLVM-exception')
# keep poppler for pdftoppm
depends=('libcups' 'libexif' 'pdfio' 'libjxl' 'poppler'
         'libjpeg-turbo' 'libpng' 'libtiff' 'lcms2'
         'fontconfig' 'glibc' 'dbus')
makedepends=(
	'ghostscript'
	'git' 
#        'mupdf-tools' ???
)
checkdepends=('ttf-dejavu') # ttf-dejavu for make check
source=(#"https://github.com/OpenPrinting/libcupsfilters/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
        "git+https://github.com/OpenPrinting/libcupsfilters#commit=$_commit"
        # libcupsfilters-PR167.patch::https://github.com/OpenPrinting/libcupsfilters/pull/167.patch
        )
sha256sums=('a4763c4ac2722dc3c40ae7a287aa9d59640ca24d6d433fc7ed0b0da5f4dd172d'
            # 'fa77ba778dcbea8826edcf87c4d022a11c073d288b39a1eaf06e0eaf3376f525')
)

pkgver() {
 cd $pkgname
 git describe --tags | sed 's/-/.r/' | sed 's/-/./'
}

prepare() {
  cd "$pkgname" #-$pkgver
  # https://github.com/OpenPrinting/libcupsfilters/issues/209
  # patch -Np1 -i ../libcupsfilters-PR167.patch
  autoreconf -vfi
}

build() {
  cd "$pkgname" #-$pkgver
  ./configure --prefix=/usr  \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-mutool
  make
}

check() {
  cd "$pkgname" #-$pkgver
  make check
}

package() {
  cd "$pkgname" #-$pkgver
  make DESTDIR="$pkgdir/" install
  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
  # install -m644 "${srcdir}"/${pkgname}-${pkgver}/{COPYING,NOTICE} "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -m644 "${srcdir}"/${pkgname}/{COPYING,NOTICE} "${pkgdir}"/usr/share/licenses/${pkgname}/
}
