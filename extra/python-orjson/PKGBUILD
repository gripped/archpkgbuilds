# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=orjson
pkgname=python-orjson
pkgver=3.11.5
pkgrel=2
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
sha512sums=('557460b3e0766a60ac74a77d9ede408424599dfb2f17cadd60f6c936c89068d379d46a4d197e2a2a04b0153306414535e4b796aff95060d3f3c8287518336017')
b2sums=('fe1bdf2722a4c3b0939ccdc74cdbe33668eb1724cf11608b252e0bd0da096cae45d5fb058bb4a84d4c69fd1cce5eae2f6b364854e490dd50c9034d7af16c6de5')

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
