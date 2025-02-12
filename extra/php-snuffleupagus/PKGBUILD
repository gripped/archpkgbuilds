# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Julien (jvoisin) Voisin <julien.voisin+snuffleupagus@dustri.org>

pkgname=php-snuffleupagus
_pkgname=snuffleupagus
pkgver=0.11.0
pkgrel=2
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
sha256sums=('7ed7dd3aca0a8f0971e87b56c19c60a1a4d654ee4cbbee9a5091b9d4cca28a34')
b2sums=('ee3dda0c646af72e80fad087850bdf8af5a63a008d14b5b25d05ac32af6ee6212f04b8fcbca6e70680f72acac4a21bbbfd9ebeb336cafa04bc95e6cce4ee1412')

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
  install -D -m644 "config/default_php8.rules" "${pkgdir}/etc/php/conf.d/${_pkgname}.rules"
  install -D -m644 "config/${_pkgname}.ini" "${pkgdir}/etc/php/conf.d/${_pkgname}.ini"
}

# vim: ts=2 sw=2 et:
