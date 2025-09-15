# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-copr
pkgver=2.2
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
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("git+$url.git#tag=copr-cli-$pkgver-1")
sha512sums=('8778a4ddf16d187c4d8f8a66482ff5bf991af190b50ef00d6b35a5961308092b2f963bfd2554805fa5ac6d2c1b0aeea20fa15a481c9a12f05fcdc5483d3bb367')

build() {
  cd copr/python
  python -m build --wheel --no-isolation
}

check() {
  cd copr/python
  pytest
}

package() {
  cd copr/python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
