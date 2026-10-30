# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cachetools
pkgver=7.2.7
pkgrel=1
pkgdesc="Extensible memoizing collections and decorators"
url="https://github.com/tkem/cachetools"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/tkem/cachetools.git#tag=v$pkgver")
sha512sums=('6bf0482d0d081553304222a8e9b09cd4451c73f7e87f9fe895d8e692a9fc45f6f3554aaa787dbe8a1fe24509a0c32305ae927522a300a419dad771796b49946f')

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
