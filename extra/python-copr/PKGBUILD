# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-copr
pkgver=2.9
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
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("git+$url.git#tag=python-copr-$pkgver-1")
b2sums=('cbc24bc40fadd8f977b8b35b5fa8e71822e39ca0f1bcd697663ae13ad1350796574fc32589d11b2b3149ad5080fb02e0e37a5975ddc8b598a212d8e7ed775317')

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
