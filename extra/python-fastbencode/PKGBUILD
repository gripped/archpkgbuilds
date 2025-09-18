# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-fastbencode
_pkgname=fastbencode
pkgver=0.3.6
pkgrel=1
pkgdesc="Implementation of bencode with optional fast C extensions"
arch=(x86_64)
url="https://github.com/breezy-team/fastbencode"
license=(GPL-2.0-or-later)
depends=(
  gcc-libs
  glibc
  python
)
makedepends=(
  cython
  python-build
  python-installer
  python-setuptools-rust
  python-wheel
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('39d7379a865348fd9a52fd7d412723f9fa707e16d8f8a626acb6451b598e7a1e')

build() {
  cd $_pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  python -m unittest discover -v
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
