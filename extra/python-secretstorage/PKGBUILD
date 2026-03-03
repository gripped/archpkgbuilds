# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: JonnyJD <arch@JonnyJD.net>

pkgname=python-secretstorage
pkgver=3.4.0
pkgrel=1
pkgdesc="Securely store passwords and other private data using the SecretService DBus API"
arch=('any')
url="https://github.com/mitya57/secretstorage"
license=('BSD-3-Clause')
depends=('python-cryptography' 'python-jeepney')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('org.freedesktop.secrets' 'xorg-server-xvfb')
source=("git+https://github.com/mitya57/secretstorage.git#tag=$pkgver")
sha512sums=('ed03e1b15d8d618ca35d9a44fe8bacce4fc76f0509401893d1cf44a112772798b9bbfd3f61ac6871dcebcd5bf83053a228b3ad53419157aca56fbb804b6db9e7')

build() {
  cd secretstorage

  python -m build --wheel --no-isolation
}

check() {
  cd secretstorage

  dbus-launch xvfb-run -a python -m unittest discover -s tests
}

package() {
  cd secretstorage

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
