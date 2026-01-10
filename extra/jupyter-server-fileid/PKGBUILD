# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=jupyter_server_fileid
pkgname=jupyter-server-fileid
pkgver=0.9.3
pkgrel=3
pkgdesc='A Jupyter Server extension providing an implementation of the File ID service'
arch=(any)
url='https://jupyter.org/'
license=(BSD-3-Clause)
depends=(jupyter-server
         python
         python-click
         python-jupyter-core
         python-jupyter-events
         python-tornado
         python-traitlets)
makedepends=(git
             python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest-jupyter)
source=(git+https://github.com/jupyter-server/$_pyname#tag=v$pkgver)
sha256sums=('d164e126ce580147f2de6e91b8a5b65bd5e5781934acf5a603b17a9c05235cab')

build() {
  cd $_pyname
  python -m build -wn
}

check() {
  cd $_pyname
# https://github.com/jupyter-server/jupyter_server_fileid/issues/58
  pytest -v -k 'not test_get_path_oob_move_nested and not test_get_path_oob_move_deeply_nested'
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  mv "$pkgdir"/{usr/,}etc
}
