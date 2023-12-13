# Maintainer: Laurent Carlier <lordheavym@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=lib32-lcms2
pkgver=2.16
pkgrel=1
pkgdesc="Small-footprint color management engine, version 2 (32-bit)"
arch=('x86_64')
license=('MIT')
depends=('lib32-libtiff' 'lcms2')
provides=('liblcms2.so')
makedepends=('gcc-multilib')
url="https://www.littlecms.com"
source=("https://github.com/mm2/Little-CMS/releases/download/lcms${pkgver}/lcms2-${pkgver}.tar.gz")
sha512sums=('638dd6ad6787456c8145510d18b2d0727bd0a446a13ac2934aabc9531d1156eca2a2c0fd780a453823fbd35a1895f9d8de5dc4b3cab505459dd3f0535b4e837d')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd lcms2-${pkgver}

  ./configure --prefix=/usr \
    --libdir=/usr/lib32
  make
}

check() {
  cd lcms2-${pkgver}

  make check
}

package() {
  cd lcms2-${pkgver}

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "${pkgdir}/usr/share/licenses"
  ln -s lcms2 "${pkgdir}/usr/share/licenses/${pkgname}"
}
