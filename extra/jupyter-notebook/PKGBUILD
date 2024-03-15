# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=jupyter-notebook
_pipname=notebook
pkgver=7.1.2
pkgrel=1
pkgdesc='The language-agnostic HTML notebook application for Project Jupyter'
arch=(any)
url='https://github.com/jupyter/notebook'
license=(BSD-3-Clause)
depends=(jupyter-notebook-shim
         jupyter-server
         jupyterlab
         python
         python-jupyter-client
         python-jupyter-core
         python-jupyterlab-server
         python-tornado
         python-traitlets)
makedepends=(python-build
             python-hatch-jupyter-builder
             python-installer)
checkdepends=(python-pytest-jupyter
              python-pytest-timeout
              python-requests)
replaces=(jupyter-retrolab)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('efc2c80043909e0faa17fce9e9b37c059c03af0ec99a4d4db84cb21d9d2e936a')

build() {
  cd notebook-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd notebook-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v -W ignore::DeprecationWarning
}

package() {
  cd notebook-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"/{usr/,}etc

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 jupyter-notebook.desktop -t "$pkgdir"/usr/share/applications
}
