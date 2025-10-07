# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgbase=maturin
pkgname=(
  maturin
  python-maturin
)
pkgver=1.9.5
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
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('070343f219cb21b1831ab514a4db47b6a95d89d996e0b7ff072f5b938b9d6aa27a811d72a28f36645493d3929beb5bfff004b9b0ea96df83b90cf4169a3b78c7')
b2sums=('e366629309b343769ef1346574cda0f5806c899e909142eff834170f3252f6c9e4ee56bcce50ba5b697d0c50baaabdc6ebc630508a4d0f27900ffb9f8827d9c9')

prepare() {
  cd $pkgbase
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
