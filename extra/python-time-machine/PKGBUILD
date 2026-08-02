# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-time-machine
pkgver=3.3.0
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
)
optdepends=(
  'python-pytest: for pytest plugin'
  'python-tokenize-rt: for the migration tool'
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('a1593df95422ca2127d8cec9cbf7e75f885b339914f08ab056f44ece7fda7d90ccf0afcbb043f36186ef9dbe2788406bbb443e246ef6891f01a7ecb35957f0ee')
b2sums=('9879b6135f03bfcbd4528a71e736a7a3a501f63598377d090d5c94968aae4bfb17d57621daf7f58c4fe29e0482b3be57be1996684f2bfca8b6ff0365aba11d49')

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
