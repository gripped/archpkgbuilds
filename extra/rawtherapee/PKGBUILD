# Maintainer: Lukas Jirkovsky <l.jirkovsky AT gmail.com>
# Contributor: Bogdan Szczurek <thebodzio(at)gmail.com>
# Contributor: Vaclav Kramar <vaclav.kramar@tiscali.cz>
# Contributor: Archie <mymaud@gmail.com>

pkgname=rawtherapee
epoch=1
pkgver=5.11
pkgrel=1
pkgdesc='A powerful cross-platform raw image processing program'
arch=('x86_64')
url='https://www.rawtherapee.com/'
license=('GPL3')
depends=('exiv2' 'fftw' 'gtk3' 'glibmm' 'gtkmm3' 'lcms2' 'lensfun' 'libcanberra'
         'libiptcdata' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('cmake')
source=("https://github.com/Beep6581/RawTherapee/releases/download/${pkgver}/rawtherapee-$pkgver.tar.xz")
sha1sums=('2cb2932a904660158ee9ae8eafd8c07de77ed195')
sha256sums=('e584c18dec112de29954b2b6471449a302a85e5cca4e42ede75fa333a36de724')

build() {
  mkdir -p "$srcdir/$pkgname-build"
  cd "$srcdir/$pkgname-build"

  cmake "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCACHE_NAME_SUFFIX=""
  make
}

package() {
  cd "$srcdir/$pkgname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
