# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=orjson
pkgname=python-orjson
pkgver=3.11.1
pkgrel=1
pkgdesc="Fast, correct Python JSON library supporting dataclasses and datetimes"
arch=(x86_64)
url="https://github.com/ijl/orjson"
license=(
  Apache-2.0
  MIT
)
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
sha512sums=('89b449c35222223c20b32ea692307d215621e8f5e81e0b045f628f92a86e870ac1a8183316191cbc16ee45cc6e07d4a799c287c0dfa7f6f376a0ee876337b896')
b2sums=('feea3a0de3d6b983a1214c4309bf5d59f8d5fbe1d658fa7d01d19e6e6adcce9bcba6242847ee4aed3bbec964686fa70fcf83179efddceecec2fcb3e79e93235c')

build() {
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
