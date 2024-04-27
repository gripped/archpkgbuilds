# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=hatch_jupyter_builder
pkgname=python-hatch-jupyter-builder
pkgver=0.9.1
pkgrel=2
pkgdesc='A hatch plugin to help build Jupyter packages'
arch=(any)
url='https://jupyter.org/'
license=(BSD-3-Clause)
depends=(python
         python-hatchling
         python-packaging
         python-tomli)
makedepends=(python-build
             python-installer)
checkdepends=(python-pytest
              python-pytest-mock
              python-tomli)
source=(https://github.com/jupyterlab/hatch-jupyter-builder/releases/download/v$pkgver/${_pipname//-/_}-$pkgver.tar.gz)
sha256sums=('79278198d124c646b799c5e8dca8504aed9dcaaa88d071a09eb0b5c2009a58ad')

build() {
  cd $_pipname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pipname-$pkgver
  pytest -v
}

package() {
  cd $_pipname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
