# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-regress
_name=regress
pkgver=2024.11.1
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
sha512sums=('a2d68fc73cd9f5fedc3d6a5d48c00b0eaa4710395401eb90560ebba1a69fa52095c38da28e91bb83a4fc5572cc146e85a7a154fa38e7c85db8c19634f3679841')
b2sums=('b1dd84580b8b247f3b75c0fd27c2c0ac0c7385a1dac82f766aeba36b91d6da00362c15c278bcaa622beeb428241bd5153fc4608cd974fe9948181ffeb7340747')

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
