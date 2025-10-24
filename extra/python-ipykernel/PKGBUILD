# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pyname=ipykernel
pkgname=python-$_pyname
pkgver=7.0.1
pkgrel=2
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
         python-packaging
         python-psutil
         python-pyzmq
         python-tornado
         python-traitlets)
makedepends=(git
             python-build
             python-hatchling
             python-installer)
checkdepends=(python-debugpy
              python-flaky
              python-ipyparallel
              python-matplotlib
              python-pytest-asyncio
              python-pytest-cov
              python-pytest-timeout)
optdepends=('python-debugpy: debugger support')
source=(git+https://github.com/ipython/ipykernel#tag=v$pkgver)
sha256sums=('46b8da396ff56bacc8d217c4b6b6d7077fb6a606535ca142a0519dae0a63cd55')

prepare() {
  cd $_pyname
  git cherry-pick -n 7193d14de447a18470a18d60b81eda5f0048b6aa # Fix routing of background thread output when no parent is set explicitly
  git cherry-pick -n c7af34cd19ebcd43f5aafe1919909feb6e898387 c56a7aab3cad1fb91f7e7185dc7403d561ecd667 # Fix matplotlib eventloops
}

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  PYTHONPATH="$PWD" \
  pytest -v -W ignore::ResourceWarning
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
