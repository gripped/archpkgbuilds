# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: JonnyJD <arch@JonnyJD.net>

pkgname=python-secretstorage
pkgver=3.4.1
pkgrel=1
pkgdesc="Securely store passwords and other private data using the SecretService DBus API"
arch=('any')
url="https://github.com/mitya57/secretstorage"
license=('BSD-3-Clause')
depends=('python-cryptography' 'python-jeepney')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('org.freedesktop.secrets' 'xorg-server-xvfb')
source=("git+https://github.com/mitya57/secretstorage.git#tag=$pkgver")
sha512sums=('375e9e16d52e9355d21ba8ada05f8f822e68af592fc95cdf18a3c7955f576ed31dba820b6ba1422468e995afab39556d3e574bd076386449c6f7ced2a2b8d142')

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
