# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Julien (jvoisin) Voisin <julien.voisin+snuffleupagus@dustri.org>

pkgname=php-snuffleupagus
_pkgname=snuffleupagus
pkgver=0.13.0
pkgrel=1
pkgdesc="Security module for PHP"
url='https://snuffleupagus.readthedocs.io/'
arch=('x86_64')
license=('LGPL-3.0-only')
depends=(
  'glibc'
  'pcre2' 'libpcre2-8.so'
  'php'
)
makedepends=('re2c')
backup=('etc/php/conf.d/snuffleupagus.ini'
        'etc/php/conf.d/snuffleupagus.rules')
source=(https://github.com/jvoisin/${_pkgname}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('350a33cd3906bdba46f5c4cf3d00edeb81eaf6a7b9a3a7e5ef47bc967492ae90')
b2sums=('76cca31850c13f4bc39fdb3ca7fa957eed5fc0be2171128cb673962155c6604c70dccd0d0c5dd87f73023f89aa080b698da57ddc85caba6854d4573b2083c970')

prepare() {
  cd ${_pkgname}-${pkgver}/src
  phpize
  ./configure --prefix=/usr --enable-"${_pkgname}"
}

build() {
  cd ${_pkgname}-${pkgver}/src
  make
}

check() {
  cd ${_pkgname}-${pkgver}/src
  NO_INTERACTION=1 REPORT_EXIT_STATUS=1 make test
}

package() {
  cd ${_pkgname}-${pkgver}
  make -C src INSTALL_ROOT="${pkgdir}" install
  install -D -m644 "config/default.rules" "${pkgdir}/etc/php/conf.d/${_pkgname}.rules"
  install -D -m644 "config/${_pkgname}.ini" "${pkgdir}/etc/php/conf.d/${_pkgname}.ini"
}

# vim: ts=2 sw=2 et:
