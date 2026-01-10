# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-regress
_name=regress
pkgver=2025.10.1
pkgrel=2
pkgdesc="Python bindings to the Rust regress crate which provides ECMA regular expressions"
arch=(x86_64)
url="https://github.com/crate-py/regress"
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
)
makedepends=(
  python-build
  python-installer
  python-maturin
  python-wheel
)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('2afe046638a845ee35509fcf4153466f6eec1dd65a8bec8d167742cf88712c17a738a4dc99a5d9eaf0cf1e5e1cac15757b113a19a03a73b908c757ea71678100')
b2sums=('96d16bd087c0e94c5d84059b04ec3991eedc345127e6dba9cbcb605bb9cdba78eb2b4364b09157bf59f23a33a1dc95319ea3776b330e22ccf3d0122c49ace313')

prepare() {
  cd $_name-$pkgver
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  local python_build_options=(
    --wheel
    --no-isolation
    -C="--target=$(rustc --print host-tuple)"
    -C="--locked"
    -C="--release"
    -C="--all-features"
    -C="--strip"
  )

  cd $_name-$pkgver
  python -m build "${python_build_options[@]}"
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
