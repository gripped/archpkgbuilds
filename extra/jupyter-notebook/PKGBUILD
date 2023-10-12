# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=jupyter-notebook
_pipname=notebook
pkgver=7.0.5
pkgrel=1
pkgdesc='The language-agnostic HTML notebook application for Project Jupyter'
arch=(any)
url='https://github.com/jupyter/notebook'
license=(BSD)
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
sha256sums=('9e7c7a91de138bc8b5ee50486a20e70fa4d82d407b5622ec8beac9e13e773181')

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
