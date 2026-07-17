# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Hayot <ghayot@postblue.info>
# Contributor: Arvedui <arvedui@posteo.de>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Joost Bremmer <toost.b@gmail.com>

pkgname=python-discogs-client
pkgver=2.9
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
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("$pkgname::git+https://github.com/joalla/discogs_client.git#tag=v$pkgver")
sha512sums=('c8781def025e675ead83d6a8da5a2d507d5e57c5479262faf7c7d4c2f996db280d0a93f62a23f53d782e7bbfbbdc42390b414e077f1924796a6af891c77d8393')
b2sums=('6e392dc4cdef912f792b397dc7450c0d5ef56feff3e46d056c537e027b6cb7ff8fdabe1c7e518d91433ccbcea1cc2c67248d5a297666dbedc250ba421b0e4605')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim: set ts=2 sw=2 et:
