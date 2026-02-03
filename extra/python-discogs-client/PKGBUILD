# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Hayot <ghayot@postblue.info>
# Contributor: Arvedui <arvedui@posteo.de>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Joost Bremmer <toost.b@gmail.com>

pkgname=python-discogs-client
pkgver=2.8
pkgrel=3
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
sha512sums=('1cb175e5589b1f221187770a52ebe19b5c70351ab03a168532b7784ec1c50075f4a252350e09ef938b98ad6d306021b70b1656f951e0f22621e84fee53fc70bc')
b2sums=('97934bc915043a73223b6e89cae6c2cbb0d4e43babf8f86015423cd69fbd536f2cb981d7c6b404625cf7482c38fd9a45e4c550795c957901168b026d0cb33cf1')

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
