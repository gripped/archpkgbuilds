# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Vamp898 <vamp898@web.de>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Todd Maynard <arch@toddmaynard.com>

pkgname=kmymoney
pkgver=5.2.1
pkgrel=1
pkgdesc="Personal finance manager for KDE which operates similarly to MS-Money or Quicken"
arch=('x86_64')
url="https://kmymoney.org/"
license=('GPL-2.0-or-later')
depends=('glibc' 'gcc-libs' 'gmp' 'libalkimia' 'sqlcipher' 'qt6-base' 'qt6-5compat' 'gpgmepp' 'karchive'
         'kcoreaddons' 'kconfig' 'kwidgetsaddons' 'ki18n' 'kcompletion' 'kcmutils' 'kitemmodels'
         'kitemviews' 'kxmlgui' 'ktextwidgets' 'kio' 'kholidays' 'kjobwidgets' 'sonnet'
         'kcolorscheme' 'kconfigwidgets' 'kdiagram' 'libical' 'libofx' 'qtkeychain-qt6'
         'kidentitymanagement' 'libakonadi' 'kcontacts' 'aqbanking' 'gwenhywfar')
makedepends=('extra-cmake-modules' 'kdoctools' 'doxygen' 'qgpgme')
optdepends=('perl: for financequote.pl')
changelog=$pkgname.changelog
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz{,.sig}
        identitymanagement.patch)
validpgpkeys=('D69A745A55331F44F404D8258D4DE062AA2EB01C')
sha256sums=('feadf40b6d4c90d77e32716a858dd23769081863104d8cea62910b1ec3e4336b'
            'SKIP'
            'a92ed7427764bbff9e043b45a38280a1e752ef70413605d34957acb3caaa9761')

prepare() {
  patch -d $pkgname-$pkgver -p1 < identitymanagement.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_WITH_QT6=ON \
    -DCMAKE_SKIP_RPATH=YES \
    -DBUILD_TESTING=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
