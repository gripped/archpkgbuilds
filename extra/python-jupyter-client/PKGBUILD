# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pyname=jupyter_client
pkgname=python-${_pyname/_/-}
pkgver=8.7.0
pkgrel=1
pkgdesc='Jupyter protocol implementation and client libraries'
arch=(any)
url='https://pypi.python.org/pypi/jupyter_client'
license=(BSD-3-Clause)
depends=(ipython
         python
         python-dateutil
         python-jupyter-core
         python-pexpect
         python-pyzmq
         python-tornado
         python-traitlets)
makedepends=(git
             python-build
             python-hatchling
             python-installer)
checkdepends=(iproute2
              net-tools
              openssh
              python-ipykernel
              python-pytest-jupyter
              python-pytest-timeout)
conflicts=(python-jupyter_client)
provides=(python-jupyter_client)
replaces=(python-jupyter_client)
source=(git+https://github.com/jupyter/jupyter_client#tag=v$pkgver)
sha256sums=('cb481964bd0dd647012eb3ec0d288c3a0179ee82a5bf23c52d1cc3aa8bad9b49')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  pytest -v -W ignore::ResourceWarning -W ignore::DeprecationWarning
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
