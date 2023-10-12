# Maintainer: David Runge <dvzrv@archlinux.org>

_name=orjson
pkgname=python-orjson
pkgver=3.9.8
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
sha512sums=('175a39f29bcd63547dcf37fac379dc6500a83083d3cc9a9871ebaf55afcbe164eec269715455c313553ffffe11fcc320f0d07f395a3c42336267566302143fb0')
b2sums=('03bcc335e3a868bdc5877736d273e87ee17af3285de4bbb528f50d0f7e97866190dbfe56d762d9b0b3e3d3f70d338a996bf8e2b03392ae11f11a972721f76d14')

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
