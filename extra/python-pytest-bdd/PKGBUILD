# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-pytest-bdd
pkgver=9.0.1
pkgrel=1
pkgdesc='BDD library for the pytest runner'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-bdd'
depends=(
  'python'
  'python-gherkin'
  'python-mako'
  'python-packaging'
  'python-parse'
  'python-parse-type'
  'python-pluggy'
  'python-pytest'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-uv-build'
)
checkdepends=('python-setuptools')
source=("git+$url.git#tag=$pkgver")
sha512sums=('ddf6e6134784d58242c95ca5530d4b831124d368b70e1db2b073d79195d0f8201d90a7d6ccf047d1d5413d859218f50786217691ffb336c5ed10dc2405825287')

prepare() {
  cd ${pkgname#python-}
  # Allow the packaged uv-build 0.13 series.
  sed -i 's/uv_build>=0.12.13,<0.13.0/uv_build>=0.12.13,<0.14.0/' pyproject.toml
}

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH=$PWD/test-env/bin:$PATH test-env/bin/python -m pytest \
    --override-ini="addopts="
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
