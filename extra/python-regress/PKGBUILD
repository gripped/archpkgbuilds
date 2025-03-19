# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-regress
_name=regress
pkgver=2025.3.1
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
sha512sums=('6c0399877be998181144fcbfef9719cb90f8b6e4199a2ddb25a5ad1a657dd5553de1bc564c638c79d60846b914060140b3146427ca3b1f5dca5976717b422b4b')
b2sums=('29768c4dd44899f9050406fb90f42cda762b30a0c3eb399b6262e5cb103442c580b03dc5a375d98df3c3c0780429acc78b5e3b422877ae551b554c49e4b3f6f7')

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
