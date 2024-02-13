# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=jupyter_server_terminals
pkgname=python-${_pyname//_/-}
pkgver=0.5.2
pkgrel=1
pkgdesc='A Jupyter Server extension providing terminals'
arch=(any)
url=https://github.com/jupyter-server/jupyter_server_terminals
license=(BSD)
depends=(jupyter-server
         python
         python-jupyter-core
         python-terminado
         python-tornado
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest-jupyter
              python-pytest-timeout)
source=(https://github.com/jupyter-server/jupyter_server_terminals/releases/download/v$pkgver/$_pyname-$pkgver.tar.gz)
sha256sums=('396b5ccc0881e550bf0ee7012c6ef1b53edbde69e67cab1d56e89711b46052e8')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"/{usr/,}etc

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
