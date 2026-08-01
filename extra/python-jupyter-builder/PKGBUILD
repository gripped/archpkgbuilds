# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=jupyter-builder
pkgname=python-$_pyname
pkgver=1.2.1
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
sha256sums=('52d1c1a6efe0c7df2101284b470e2bd82116d7400986bb1d256c5792261e074e')

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
