# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juan Pablo Gonzalez Tognarelli <lord_jotape@yahoo.com.ar>

pkgname=uriparser
pkgver=1.0.3
pkgrel=1
pkgdesc='uriparser is a strictly RFC 3986 compliant URI parsing library. uriparser is cross-platform, fast, supports Unicode'
url='https://github.com/uriparser/uriparser'
makedepends=('cmake')
arch=('x86_64')
license=('custom')
source=("https://github.com/uriparser/uriparser/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a327e438e238d6c9093f1845acc44dec20d4264639a3de1f3caf0927bd852e3b')

build() {
  mkdir "${srcdir}"/build
  cd "${srcdir}"/build
  
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DURIPARSER_BUILD_DOCS=OFF \
    -DURIPARSER_BUILD_TESTS=OFF \
    "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}"/build

  make DESTDIR="${pkgdir}" install
  install -D -m0644 "${srcdir}/${pkgname}-${pkgver}"/COPYING.BSD-3-Clause \
    "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING.BSD-3-Clause
}
