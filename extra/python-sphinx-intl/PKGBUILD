# Maintainer:

_pyname=sphinx-intl
pkgname=python-$_pyname
pkgver=2.3.1
pkgrel=2
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
             python-setuptools)
source=(git+https://github.com/sphinx-doc/sphinx-intl#tag=$pkgver)
sha512sums=('d0727602aaf2a66f980dc8ac6da3a52d483620529d7b6bdf8eede66687c65b5ec18bd2230b279818ba03d6d6cfdfe026fdda24819266ea00a402669a4cbd0058')

build() {
  cd $_pyname

  python -m build --wheel --no-isolation
}

package() {
  cd $_pyname

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
