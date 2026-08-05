# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-time-machine
pkgver=3.3.1
pkgrel=1
pkgdesc='Travel through time in your tests'
arch=(x86_64)
url='https://github.com/adamchainz/time-machine'
license=(MIT)
depends=(
  glibc
  python
  python-dateutil
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-randomly
  python-tokenize-rt
  python-freezegun
  python-hypothesis
)
optdepends=(
  'python-pytest: for pytest plugin'
  'python-tokenize-rt: for the migration tool'
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('114e59cd7b1b6d4f9bbd94c7ff9bff578001c2f1a7d7ebd045f2581bd69fb94c425c4d1dd6f752cf09a65ec0e41efd0c92920e0c0b68e1bceb68f8b20202ae2e')
b2sums=('c316ac3c929d77b9624b37716da2518410fd981240b885083feeba029af0db094b029b90fbd66375f662a15ccae9aafa775c6fe2a8c236a741c6944e87c3eb82')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
