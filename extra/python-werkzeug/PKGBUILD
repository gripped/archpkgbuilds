# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Dan Serban
# Contributor: Richard Murri

pkgname=python-werkzeug
pkgver=3.1.5
pkgrel=1
pkgdesc='Swiss Army knife of Python web development'
url='https://werkzeug.palletsprojects.com/'
arch=('any')
license=('BSD-3-Clause')
depends=(
  'python'
  'python-markupsafe'
)
makedepends=(
  'git'
  'python-build'
  'python-flit-core'
  'python-installer'
)
checkdepends=(
  'python-cryptography'
  'python-ephemeral-port-reserve'
  'python-greenlet'
  'python-pytest'
  'python-pytest-timeout'
  'python-pytest-xprocess'
  'python-requests'
  'python-watchdog'
)
optdepends=('python-watchdog: faster and more advanced reloader')
source=("git+https://github.com/pallets/werkzeug.git#tag=${pkgver}")
sha512sums=('7d788bd8b2e10c9463a25887e93a0eed87cc7a8796205df1b85f52d90379bb62135764f680fe0e0b5abc5c571f11b694a5626b850e2397f704970c35774c9ac1')

build() {
  cd werkzeug
  python -m build --wheel --no-isolation
}

check() {
  cd werkzeug
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd werkzeug
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
