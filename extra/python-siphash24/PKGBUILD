# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=siphash24
pkgname=python-$_name
pkgver=1.8
pkgrel=3
pkgdesc="Streaming-capable SipHash implementation"
arch=(x86_64)
url="https://github.com/dnicolodi/python-siphash24"
license=("Apache-2.0 OR LGPL-2.1-or-later")
depends=(
  glibc
  python
)
makedepends=(
  cmake
  cython
  git
  meson
  meson-python
  python-build
  python-installer
  python-wheel
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('f14f49c9cad6e5f8b232af2b561f13965150a66d6b997f25b8106e5c60851d4e05736b7349bb8e3cf18916eeaf82f0b42f37945f824efe277a77698a71860eca')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation -Cbuild-dir=build
}

check() {
  cd $pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m unittest discover -v
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
