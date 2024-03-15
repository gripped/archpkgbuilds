# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Dominik Ryba <domryba@post.pl>


pkgname=enblend-enfuse
pkgver=4.2.r1546+hb66125418f7d
_commit=b66125418f7d
pkgrel=2
pkgdesc="Intelligent blend tool for overlapping picture"
arch=(x86_64)
url="http://enblend.sourceforge.net"
license=(GPL)
depends=(lcms2 vigra gsl exiv2)
makedepends=(mercurial libjpeg libpng libtiff openexr zlib help2man boost)
source=("$pkgname::hg+http://hg.code.sf.net/p/enblend/code#revision=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "4.2.r%s+h%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd ${pkgname}
  make --makefile=Makefile.scm
}

build() {
  cd ${pkgname}
  ./configure \
    --prefix=/usr \
    --enable-openmp=yes \
    --enable-opencl=yes \
    --with-exiv2 \
    --with-openexr
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}
