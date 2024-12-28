# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-quart-trio
_pkgname=${pkgname#python-}
pkgver=0.11.1
pkgrel=1
pkgdesc="Extension for Quart to support the Trio event loop"
url=https://github.com/pgjones/quart-trio
arch=(any)
license=(MIT)
depends=(
  hypercorn
  python
  python-quart
  python-trio
  python-werkzeug
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-trio
)
source=(
  "$url/archive/$pkgver/$_pkgname-$pkgver.tar.gz"
  "only-import-exceptiongroup-on-Python-3.10-and-older.patch::$url/commit/2b6e1168feb886a3b4c695a7548937386ad0cbcd.patch"
  "fix-test-failures.patch::$url/commit/805686abfd9963be26d59d9da9b11faddd583d11.patch"
)
sha256sums=('9aa24b3fb20345ee8d79179d23d5df2d72dc0a2a8a3562fdad7c2900a2fd12d0'
            '24527eb9d0e61d866f0bffa64f717b3007f77d744ea201f7e499bcd2e96ff94f'
            '3309821d66ab60130b2dacfe66991c0daf41c59bdfc05308f88f796b3b0eede2')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -Np1 -i ../only-import-exceptiongroup-on-Python-3.10-and-older.patch
  patch -Np1 -i ../fix-test-failures.patch
}

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --override-ini="addopts="
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
