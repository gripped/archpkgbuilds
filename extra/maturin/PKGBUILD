# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgbase=maturin
pkgname=(
  maturin
  python-maturin
)
pkgver=1.7.8
pkgrel=1
pkgdesc="Build and publish crates with pyo3, rust-cpython and cffi bindings"
url="https://github.com/PyO3/maturin"
arch=(x86_64)
license=('Apache-2.0 OR MIT')
makedepends=(
  bzip2
  gcc-libs
  git
  glibc
  python-build
  python-installer
  python-setuptools
  python-setuptools-rust
  python-wheel
  rust
)
# disable LTO until ring can be built with it: https://github.com/briansmith/ring/issues/1444
options=(!lto)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('11dd229bc0a240fe915ae4aa69d5dd10032ea41782cb2bf76e77e58a8d474543b133a78d6b24a0383ef281f83122f34e1e0c332227720643b63226c18e318445')
b2sums=('0fcd40dbf20cd961aa97e936b58ea79aceddfe6175ba4c1d1b413c224c889f393719dffe583859c35894173801cbd5303093802c5a4986038eb00a1f4ff3f3d4')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#"$pkgdir/"}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

prepare() {
  cd $pkgbase-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgbase-$pkgver
  MATURIN_SETUP_ARGS="--all-features" python -m build --wheel --no-isolation
}

package_maturin() {
  depends=(
    bzip2
    gcc-libs
    glibc
    openssl
    rust
  )

  cd $pkgbase-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {Changelog,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 license-mit -t "$pkgdir/usr/share/licenses/$pkgname/"

  (
    cd "$pkgdir"
    _pick python-$pkgbase usr/lib
  )
}

package_python-maturin() {
  pkgdesc+=" - Python bindings"
  groups=(python-build-backend)
  depends=(
    maturin=$pkgver
    python
  )

  mv -v $pkgname/* "$pkgdir"

  install -vDm 644 $pkgbase-$pkgver/license-mit -t "$pkgdir/usr/share/licenses/$pkgname/"
}
