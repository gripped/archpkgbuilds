# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=jupyter-builder
pkgname=python-$_pyname
pkgver=1.2.2
pkgrel=1
pkgdesc='Build tools for JupyterLab'
arch=(any)
url='https://jupyter.org/'
license=(BSD-3-Clause)
depends=(python
         python-jupyter-core
         python-traitlets)
makedepends=(git
             python-build
             python-hatch-nodejs-version
             python-hatchling
             python-installer)
checkdepends=(python-pytest)
source=(git+https://github.com/jupyterlab/jupyter-builder#tag=v$pkgver)
sha256sums=('bd884d6b31b0e27357da2cd9053921e8314d44c0389defa9b22a0bcc51f3c41d')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
#  needs unpackaged copier
#  pytest -v 
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
