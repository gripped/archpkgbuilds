# Maintainer:

_pyname=sphinx-intl
pkgname=python-$_pyname
pkgver=2.3.2
pkgrel=1
pkgdesc='A Sphinx utility that make it easy to translate and to apply translations'
arch=(any)
url='https://github.com/sphinx-doc/sphinx-intl'
license=(BSD-2-Clause)
depends=(python
         python-babel
         python-click
         python-sphinx)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-setuptools-scm)
source=(git+https://github.com/sphinx-doc/sphinx-intl#tag=$pkgver)
sha512sums=('1bce6b1af6f87b8cb8e885822547131f59e8a382591b17c0afa914b2edd5b8b724d86b90b713481c35ceb4be9baa6d10e43360ad85f602fa919938f3cdf9cb35')

build() {
  cd $_pyname

  python -m build --wheel --no-isolation
}

package() {
  cd $_pyname

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
