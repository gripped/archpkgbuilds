# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Hayot <ghayot@postblue.info>
# Contributor: Arvedui <arvedui@posteo.de>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Joost Bremmer <toost.b@gmail.com>

pkgname=python-discogs-client
pkgver=2.7.1
pkgrel=1
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
_tag=98059c0d00a3c65afa8f1e514d3a6f1327cade3c
source=(git+https://github.com/joalla/discogs_client.git#tag=${_tag})
b2sums=('b8ebff8228c9eecc5f2ed5dff453cd54fd43b1eaf2afff2ecf33032102e272184af666c4b9aa2e903e91b229e2140853dd42e6b942aefc6a41fba8e170b44e3f')

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
