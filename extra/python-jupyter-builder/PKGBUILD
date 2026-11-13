# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=jupyter-builder
pkgname=python-$_pyname
pkgver=1.3.0
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
sha256sums=('c99cf9367110e21a9489dd0b9cb23a92a81a93a64b5c3ae848479f80eebdeed8')

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
