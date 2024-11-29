# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=jupyter-nbclient
pkgver=0.10.1
pkgrel=1
pkgdesc='A tool for running Jupyter Notebooks in different execution contexts'
arch=(any)
url='https://github.com/jupyter/nbclient'
license=(BSD-3-Clause)
depends=(jupyter-nbformat
         python
         python-jupyter-client
         python-jupyter-core
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(jupyter-nbconvert
              python-flaky
              python-ipywidgets
              python-pytest-asyncio
              python-testpath
              python-xmltodict)
source=(https://github.com/jupyter/nbclient/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('a912f708e847fb2d0c46866457dbe936661c301d5d87e46664647c4076f992d7')

build() {
  cd nbclient-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd nbclient-$pkgver
  pytest -v -k 'not test_cli_simple' # fails on build server
}

package() {
  cd nbclient-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
