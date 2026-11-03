# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-anyio
pkgver=4.16.0
pkgrel=1
pkgdesc='High level compatibility layer for multiple asynchronous event loop implementations'
arch=(any)
url='https://github.com/agronholm/anyio'
license=(MIT)
depends=(
  python
  python-idna
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-trio
  python-uvloop
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-psutil
  python-pytest
  python-pytest-mock
  python-pytest-timeout
  python-trustme
  python-truststore
)
optdepends=(
  'python-outcome: trio backend'
  'python-pytest: pytest plugin'
  'python-trio: trio backend'
  'python-uvloop: use uvloop for asyncio backend'
)
source=("git+$url.git#tag=$pkgver")
b2sums=('1b8209f3559d60888dedac9677de7a205b265aba50973ac05d71a70bc1a62d32a67e82563d3a566002136be1cadec9dad3da603366c04bdf546b050cfee12a1a')

prepare() {
  cd ${pkgname#python-}
  # pytest 9 validates native TOML types for pytest-timeout settings.
  sed -i 's/timeout = "20"/timeout = 20.0/' pyproject.toml
  # 3 seconds is too short for nested pytest subprocesses on riscv64 builders.
  sed -i 's/timeout=3)/timeout=30)/g' tests/test_pytest_plugin.py
}

build() {
  cd ${pkgname#python-}
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
