# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Hayot <ghayot@postblue.info>
# Contributor: Arvedui <arvedui@posteo.de>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Joost Bremmer <toost.b@gmail.com>

pkgname=python-discogs-client
pkgver=2.8
pkgrel=2
pkgdesc='Python Client for the Discogs API'
arch=(any)
url=https://github.com/joalla/discogs_client
license=(BSD-2-Clause)
depends=(
  python
  python-dateutil
  python-requests
  python-oauthlib
)
makedepends=(
  git
  python-setuptools
)
_tag=4320f830f85a66278046b35e65ebc3fa85c7556c
source=(git+https://github.com/joalla/discogs_client.git#tag=${_tag})
b2sums=('97934bc915043a73223b6e89cae6c2cbb0d4e43babf8f86015423cd69fbd536f2cb981d7c6b404625cf7482c38fd9a45e4c550795c957901168b026d0cb33cf1')

pkgver() {
  cd discogs_client
  git describe --tags | sed 's/^v//'
}

build() {
  cd discogs_client
  python setup.py build
}

package() {
  cd discogs_client
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-discogs-client
}

# vim: set ts=2 sw=2 et:
