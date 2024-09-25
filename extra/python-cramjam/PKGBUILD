# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-cramjam
_pkgname=${pkgname#python-}
pkgver=2.8.4
pkgrel=1
pkgdesc="Thin Python bindings to de/compression algorithms in Rust"
arch=(x86_64)
url="https://github.com/milesgranger/cramjam"
license=(MIT)
depends=(
  bzip2
  gcc-libs
  glibc
  python
)
makedepends=(
  cmake
  nasm
  python-build
  python-installer
  python-maturin
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-numpy
  python-pytest
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b3f0667f0d065c55221c032dcfb6b910ff7a8e334cb93b03c8a44a426e6f2dc4')

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest \
    --ignore=benchmarks/
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
