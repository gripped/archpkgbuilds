# Maintainer: David Runge <dvzrv@archlinux.org>

_name=orjson
pkgname=python-orjson
pkgver=3.10.0
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
sha512sums=('d8659a2eb01e6874c2d7bff37ae6978b0e346e81934d4a27b84af0ee916a785a35a524862f1f98bc8fe8c3cb35929bb16ba1f10bb5603ccf3b1e58ad2ed6ea01')
b2sums=('ebff5e120ccbc7782bfe21f624d96e38f0316b9c4b3536b6b6e2473f87f081f355fe67a01db9cb7d63eab81f0283fda145d434aee07cc2439b19c29eabea5767')

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
