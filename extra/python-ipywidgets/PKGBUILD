# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-ipywidgets
_pipname=ipywidgets
pkgver=8.1.6
pkgrel=1
pkgdesc='IPython HTML widgets for Jupyter'
arch=(any)
url='https://github.com/ipython/ipywidgets'
license=(BSD-3-Clause)
depends=(ipython
         python
         python-comm
         python-ipykernel
         python-matplotlib-inline
         python-traitlets)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-wheel)
optdepends=('jupyterlab-widgets: widgets for Jupyter lab')
checkdepends=(python-ipykernel
              python-jsonschema
              python-pytest
              python-pytz)
source=(git+https://github.com/jupyter-widgets/ipywidgets#tag=$pkgver)
sha256sums=('fc4843d7b9f1f819f2d245e1abc003b907479b6a9b5febe247937bcf08af0c60')

build() {
  cd ipywidgets/python/ipywidgets
  python -m build --wheel --no-isolation
}

check() {
  cd ipywidgets/python/ipywidgets
  pytest -v
}

package() {
  cd ipywidgets/python/ipywidgets
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
