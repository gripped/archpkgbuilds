# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-copr
pkgver=2.0
pkgrel=2
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
  'python-six'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$url/archive/python-copr-$pkgver-1.tar.gz")
sha512sums=('09d7be77a4f13806e405749e34add9643b793316b2e290eea45b3e3deaabda0fedfc6f3ec7e4c0b458d695094e8a7d8603cb8e93d3a8c34d9af43b8b53d646ea')

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
