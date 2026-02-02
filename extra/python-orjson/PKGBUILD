# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=orjson
pkgname=python-orjson
pkgver=3.11.7
pkgrel=1
pkgdesc="Fast, correct Python JSON library supporting dataclasses and datetimes"
arch=(x86_64)
url="https://github.com/ijl/orjson"
license=('Apache-2.0 OR MIT')
depends=(
  gcc-libs
  glibc
  python
)
makedepends=(
  maturin
  python-installer
  rust
)
checkdepends=(
  python-arrow
  python-pendulum
  python-psutil
  python-pytest
  python-pytz
  python-xxhash
)
source=($url/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('92850fa4c68e017c99869eff1e3158e87706e997ec74a8b4f460f8196485b804ee650f9e50b65a8fd694f1262048d0b1770048a0ea11f668e9e21d7ff0e1daaf')
b2sums=('6b410f8115e27cd8c3d5070b9ee7fd5846cce5ce535319d0072da7bbcb3048dec65edd89921b13e8de84da7500eecd9d05c18fb1827af854f4b606da425dcd31')

build() {
  # Full LTO removes symbols from the resulting library.
  # https://github.com/ijl/orjson/issues/613
  CFLAGS+=" -ffat-lto-objects"

  cd $_name-$pkgver
  maturin build --release --strip
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir target/wheels/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" target/wheels/*.whl
  install -vDm 644 {CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE-* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
