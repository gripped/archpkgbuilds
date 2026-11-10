# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-semver
pkgver=3.1.1
pkgrel=1
pkgdesc="Python helper for Semantic Versioning"
url="https://github.com/python-semver/python-semver"
license=('BSD-3-Clause')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/python-semver/python-semver.git#tag=$pkgver")
sha512sums=('780a226102e0f1316d8a512a52bfea7f90f2908be44eecfa33da06ecc04f5e2ef1e84fffff321fda6cdef508a377da57f74195261553e59b4b1f682fb51c39f5')

build() {
  cd python-semver
  python -m build -nw
}

check() {
  cd python-semver
  pytest -o addopts=''
}

package() {
  cd python-semver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
