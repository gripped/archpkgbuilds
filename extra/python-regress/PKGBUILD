# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-regress
_name=regress
pkgver=2025.5.1
pkgrel=1
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
sha512sums=('c63c76e1645ac85b550879c19bf952288cc6ea065271bb65ba19cf11fa3fdb532b7f36012769e91956f28c15894accfee6ae8439f707601fac8afb78f225d292')
b2sums=('32daf50aacd2f97e8b1b8ccbfcfd767b45e10cae3d516ea5b1dc5385193138a13791f327524293110a61540fcf4fd9822e437e7dd2a1d411403c52e40889dc72')

prepare() {
  cd $_name-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  local python_build_options=(
    --wheel
    --no-isolation
    -C="--target=$(rustc -vV | sed -n 's/host: //p')"
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
