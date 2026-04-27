# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-copr
pkgver=2.6
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
b2sums=('c60f92d9cfac953224f79512fb3ed2f89d72ff9bb3785b85bb8078e42031a6e12a621f398814157102394c64e8672c6b959a2580822ebb2de55914a4b77291e3')

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
