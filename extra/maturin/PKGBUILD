# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgbase=maturin
pkgname=(
  maturin
  python-maturin
)
pkgver=1.12.0
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
  xz
)
checkdepends=(
  python-cffi
  python-pycparser
  python-virtualenv
)
# Disable LTO until ring can be built with it:
# https://github.com/briansmith/ring/issues/1444
options=(!lto)
source=("git+$url.git#tag=v$pkgver")
sha512sums=('7edfcbfa8f4134e29d5c0cefa91784393ee3637e9059ed8c4f5a9f9841be68d099bc62b9df5be6c4d6bc3c5898d09aa87da2f630f253ecbc4eb0e2dea0ef760f')
b2sums=('8c5385ee265aebffeca539dc8e762590cf81a3d89cc4c772447b6cb893b6e64400619bfc7b288a535bb7562c9dbe8267bde6890e052c08db785b6961cd48763e')

prepare() {
  cd $pkgbase
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgbase
  MATURIN_SETUP_ARGS="--frozen" python -m build --wheel --no-isolation
}

check() {
  cd $pkgbase
  mkdir -p test-crates/venvs
  local cargo_skip_args=(
    # Requires wasm32-wasip1 target
    --skip=integration_wasm_hello_world
  )
  # Using --all-features here causes test failures due to:
  #   Cause: unsupported Zip archive: Unsupported compression level
  cargo test --frozen -- "${cargo_skip_args[@]}"
}

package_maturin() {
  depends=(
    bzip2
    gcc-libs
    glibc
    openssl
    rust
    xz
  )

  cd $pkgbase
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -vr "$pkgdir/usr/lib"
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" {Changelog,README}.md
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" license-mit
}

package_python-maturin() {
  pkgdesc+=" - Python bindings"
  groups=(python-build-backend)
  depends=(
    "maturin=$pkgver"
    python
  )

  cd $pkgbase
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -vr "$pkgdir/usr/bin"
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" license-mit
}
