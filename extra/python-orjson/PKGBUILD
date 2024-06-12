# Maintainer: David Runge <dvzrv@archlinux.org>

_name=orjson
pkgname=python-orjson
pkgver=3.10.4
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
sha512sums=('d48c46a0a3b058900c7685688de6ccc601948ebcbf803a89945016039d51d72488fb1ef317c42c5c14e8144ceaeec5294914ebe961c40b39c4604fbe27d5d9bf')
b2sums=('0eb904de5d2a7f1bb3286a43d677ea8adf84b8c42c3d5e74d372680dbe333cf6061b8d74406fe07f26c5ed9639b1430f1bf8e5675f68d62f610cd9f7fe580ca1')

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
