# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=xpdf
pkgver=4.06
pkgrel=1
pkgdesc='Viewer for Portable Document Format (PDF) files'
arch=('x86_64')
url='https://www.xpdfreader.com/'
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'gsfonts'
  'libcups'
  'libjpeg-turbo'
  'libpaper'
  'libpng'
  'libtiff'
  'libxt'
  'qt6-base'
  'qt6-svg'
  'xdg-utils'
)
makedepends=(
  'cmake'
  'qt6-tools'
  'zlib'
)
optdepends=(
  'desktop-file-utils: for desktop environments'
  'poppler: tools that used to be included in xpdf'
)
backup=('etc/xpdfrc')
source=(
  "https://dl.xpdfreader.com/xpdf-${pkgver}.tar.gz"
  "https://dl.xpdfreader.com/xpdf-${pkgver}.tar.gz.sig"
  "https://src.fedoraproject.org/rpms/xpdf/raw/rawhide/f/xpdf-4.06-permissions.patch"
  "xpdf-4.00-xpdfrc.patch"
  "xpdf.desktop"
)
sha512sums=('ace2d2c006411ef40f3510fe34809e6ed5fd4a2367ac11a75e9d4795aa5054e72f12e307165d11a25b12609d33b279b9b99d9c072442e98308a77ad022bc8355'
            'SKIP'
            'd7d6530e625979a26ae00403e8a69d064ce430d8f1b7c9d904a6e091990a39a677c00cc5f2f1073e26d4a9f8799ba559b78e48fe007846ef6e42b8d1e5262f12'
            'c5ce8ef29d9b338fe3623fa52904d4fee5d76a34145614d05abe168108579608f3d16d0d03d34865e43980eb1b2a814f07aa3dbcfc0da06de34bd9b0738eef67'
            'd6163eb220bd567226c6006bef30c6db1eac1263ae161392db9766dca1ce78014cc555dd9d27febd2b924150053fa01b47c06777b1e760864459574c7614bfc4')
validpgpkeys=('A56006CA75CF8B13FA2F120DF4825F5397271342') # -Xpdf- <xpdf@xpdfreader.com>

prepare() {
  cd ${pkgname}-${pkgver}
  cp doc/sample-xpdfrc xpdfrc
  patch -Np1 < ../xpdf-4.06-permissions.patch
  patch -Np1 < ../xpdf-4.00-xpdfrc.patch
  sed 's:/usr/share/fonts/type1/gsfonts:/usr/share/fonts/Type1:' -i xpdf/GlobalParams.cc
}

build() {
  cmake -S ${pkgname}-${pkgver} -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DMULTITHREADED=ON \
    -DOPI_SUPPORT=ON \
    -DXPDFWIDGET_PRINTING=ON \
    -DSYSTEM_XPDFRC=/etc/xpdfrc
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  cd ${pkgname}-${pkgver}
  install -vDm 644 -t "${pkgdir}/etc" xpdfrc
  install -vDm 644 -t "${pkgdir}/usr/share/applications" ../xpdf.desktop
  install -vDm 644 xpdf-qt/xpdf-icon.svg "${pkgdir}/usr/share/pixmaps/xpdf.svg"
  install -vDm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README CHANGES

  # remove stuff provided by poppler
  for tool in pdfdetach pdffonts pdfimages pdfinfo pdftoppm pdftops pdftotext pdftohtml; do
    rm -v "${pkgdir}/usr/bin/${tool}" "${pkgdir}/usr/share/man/man1/${tool}.1"
  done
}
