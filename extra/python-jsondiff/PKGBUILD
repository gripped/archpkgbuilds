# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-jsondiff
_pkgname=jsondiff
pkgver=2.1.1
pkgrel=1
pkgdesc='Diff JSON and JSON-like structures in Python'
arch=(any)
url='https://github.com/xlwings/jsondiff'
license=(MIT)
depends=(python python-yaml)
makedepends=(git python-build python-installer python-setuptools python-wheel python-setuptools-scm)
checkdepends=(python-pytest python-hypothesis)
source=("git+https://github.com/xlwings/jsondiff.git#tag=$pkgver")
sha256sums=('104e73a07fb4a4ad4495ace47d2554de37022b1e54da622e7de999dc81856f7a')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  pytest -v tests
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
