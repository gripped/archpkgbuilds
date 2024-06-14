# Maintainer: David Runge <dvzrv@archlinux.org>

_name=orjson
pkgname=python-orjson
pkgver=3.10.5
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
sha512sums=('0a04d53751ce6a537586c846c8620b2baf703fe9cbef5c1084f7ccc621c35a4f495a96a5b3a33571dd059ebdde4f190dfc11d2f8e6f6b7777e392cfc6117f8fa')
b2sums=('b91eaa7fdc0f4b293978674514f710796119789a5b72a791a21da271308525a26bb61ba1c9df070da98d9cb20eec9999bb99464816cbffad8b93ebdf68322ea8')

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
