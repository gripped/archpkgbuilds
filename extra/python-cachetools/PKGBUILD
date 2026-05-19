# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cachetools
pkgver=7.1.3
pkgrel=1
pkgdesc="Extensible memoizing collections and decorators"
url="https://github.com/tkem/cachetools"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/tkem/cachetools.git#tag=v$pkgver")
sha512sums=('d7451b332a790c641d84b2494f15bc3b76e9f2d23a0264119de4e417535b2cb6f2e5b1d9f12867bbc5149a65c49eaffb9178e43717107e80bfe7ef1a2a097fed')

build() {
  cd cachetools
  python -m build --wheel --no-isolation
}

check() {
  cd cachetools
  PYTHONPATH=src pytest
}

package() {
  cd cachetools
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
