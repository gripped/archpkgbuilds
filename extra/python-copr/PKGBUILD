# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-copr
pkgver=2.1
pkgrel=1
pkgdesc="Python interface for Copr"
url="https://github.com/fedora-copr/copr"
license=('GPL-2.0-or-later')
arch=('any')
depends=(
  'python'
  'python-filelock'
  'python-munch'
  'python-requests'
  'python-requests-gssapi'
  'python-requests-toolbelt'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$url/archive/python-copr-$pkgver-1.tar.gz")
sha512sums=('62917d1ebff07fd7bb2efffa19f2d570836a5873ac0827c698ad9a09f18bb014100162df2c885163e90d7cb84cf1c7f0ab33b7557bba96510929e35f0b3d1743')

build() {
  cd copr-python-copr-$pkgver-1/python
  python -m build --wheel --no-isolation
}

check() {
  cd copr-python-copr-$pkgver-1/python
  pytest
}

package() {
  cd copr-python-copr-$pkgver-1/python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
