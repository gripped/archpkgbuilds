# Maintainer: David Runge <dvzrv@archlinux.org>

_name=orjson
pkgname=python-orjson
pkgver=3.10.2
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
sha512sums=('de3f16174b49a249fdbab213b3fb3b6768583fc4be1e172ec05eacadb444beebdeaee0b9b776c148d103373724e0871e776afae40dad3f5f1daae3d919d9b75c')
b2sums=('e3af976563ac00e1a766604d35bc493c76fceb92f250c490c7c3947199662ed005aeba4459af81da25e8db06c0eee5bcde330dcb6f41993fe46f2c32cf216d1a')

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
