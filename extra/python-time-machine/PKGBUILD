# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-time-machine
pkgver=3.4.0
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
sha512sums=('74f191215ad64900d73e2607688f985f37cd4fbde343c13718b04a6ecb45db1d3351367acaa7d44b93aa5da8ea5a5d080dd66e173e4974b7680e8ba15d258920')
b2sums=('0098ebc4edb1962eea8e64b89c9078d2a3db8039fa591be166fd3a2e34c593bb421e44914361cbdf9762554fa0a9aadb5f0f933584337d8d7aab43455938a8f0')

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
