# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=libcupsfilters
pkgver=2.2.1.r108.g3bf18925
_commit=3bf18925e58adffe008a155733708e26481640fc # master 2026-11-18
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
sha256sums=('617c1fdad009ba56d27a07f5a40e0e3534eb2e848ca986108c6eb2eeb45fb67e'
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
