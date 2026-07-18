# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=jupyter-builder
pkgname=python-$_pyname
pkgver=1.1.1
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
sha256sums=('3067b15c8517e39a212e4ea4cf2013d4326d22edb33d941ce98359b413cfcb46')

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
