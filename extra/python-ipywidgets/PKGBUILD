# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-ipywidgets
_pipname=ipywidgets
pkgver=8.1.5
pkgrel=2
pkgdesc='IPython HTML widgets for Jupyter'
arch=(any)
url='https://github.com/ipython/ipywidgets'
license=(BSD-3-Clause)
depends=(ipython
         python
         python-comm
         python-ipykernel
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
sha256sums=('d604e88681644839dbf8cd45f93db05b0a346b5f3dcb0c7193ab0a0cecd190b9')

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
