# Maintainer: David Runge <dvzrv@archlinux.org>

pkgbase=maturin
pkgname=(
  maturin
  python-maturin
)
pkgver=1.7.4
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
sha512sums=('72fb43a10d3cdf35eca224232c59723bff5b9230c7d40ff01537e1ba869254b4b6e9a0c52e8b7154f7b74f0f0b5bace4e7bb9ac5257c9fbc04750160791c35e3')
b2sums=('008b2d67d553479040fcd3062b93ca12dc6f2b98c3d6cb43cac7ff0d8e4772417b99fbf2a73ed96cfcc8a7372b37d845e8485ba0afc80342943a10d716492377')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
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
