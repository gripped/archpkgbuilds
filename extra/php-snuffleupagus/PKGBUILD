# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Julien (jvoisin) Voisin <julien.voisin+snuffleupagus@dustri.org>

pkgname=php-snuffleupagus
_pkgname=snuffleupagus
pkgver=0.12.0
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
backup=('etc/php/conf.d/snuffleupagus.ini'
        'etc/php/conf.d/snuffleupagus.rules')
source=(https://github.com/jvoisin/${_pkgname}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('48e8f5c453290a077d29e43d7de7229cb697d8bf98e61ae2e129d45ce3a49ebf')
b2sums=('8851d7703925139bf60473106a0e50138712cb4ad92f5f94bce7fca707b3b84d2ffc84d40401309848dc9687c38b005bc0eb0f5379c8c64c8a8eeb994c632a31')

build() {
  cd ${_pkgname}-${pkgver}/src
  phpize
  ./configure --prefix=/usr --enable-"${_pkgname}"
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
