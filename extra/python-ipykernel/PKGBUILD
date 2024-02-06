# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pyname=ipykernel
pkgname=python-$_pyname
pkgver=6.29.1
pkgrel=1
pkgdesc='The ipython kernel for Jupyter'
arch=(any)
url='https://pypi.org/project/ipykernel/'
license=(BSD-3-Clause)
depends=(ipython
         python
         python-comm
         python-jupyter-client
         python-jupyter-core
         python-nest-asyncio
         python-psutil
         python-pyzmq
         python-tornado
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-debugpy
              python-flaky
              python-ipyparallel
              python-matplotlib
              python-pytest-asyncio
              python-pytest-timeout)
optdepends=('python-debugpy: debugger support')
source=(https://github.com/ipython/ipykernel/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('8f02c85e848332b86a77c4b030dab044c747b1e23411e33f07d02860d14dceab')

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
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
