# Maintainer:

_pyname=pytest-mypy-testing
pkgname=python-$_pyname
pkgver=0.1.3
pkgrel=5
pkgdesc='Plugin to test mypy output with pytest'
arch=(any)
license=(Apache
         MIT)
url='https://github.com/davidfritzsche/pytest-mypy-testing'
depends=(mypy
         python
         python-pytest)
makedepends=(git
             python-build
             python-flit-core
             python-installer)
checkdepends=(python-pytest)
source=(git+https://github.com/davidfritzsche/pytest-mypy-testing#tag=v$pkgver)
sha256sums=('271794518463c32c25518ece5e1b95f3a30008e30e6349b150923e80f2e2abad')

prepare() {
  cd $_pyname
  git cherry-pick -n f50c95a607a1dc99f9cc91533499015fc16c5a73 \
                     fd42a2631d8412add7f38b09494c7559abc66bbf \
                     5acc5fea13cab35bb7074fa93bfa0623bbb6fb52 # Support python 3.14
}

build() {
  cd $_pyname
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $_pyname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname
}
