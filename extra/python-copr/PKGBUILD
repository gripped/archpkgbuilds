# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-copr
pkgver=2.5
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
b2sums=('055d9bf68046fa3f5e9365f1cf5807f87358b675bbb45a3d15be0d7462df360dfb61c70937c0b17a12c7f374e8123e3c9633815b72456eed06187e7ec7fb9d50')

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
