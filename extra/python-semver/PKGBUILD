# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-semver
pkgver=3.0.3
pkgrel=1
pkgdesc="Python helper for Semantic Versioning"
url="https://github.com/python-semver/python-semver"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/python-semver/python-semver.git#tag=$pkgver")
sha512sums=('98474781d7471d4d78b06d16bef6f709a645beaecab103c5b99b3671e214f4cb61d4c9cfd30a84070f330a4b74723e6ea5de52b1e08706b4888c5dc4702877c9')

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
