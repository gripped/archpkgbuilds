# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgbase=maturin
pkgname=(
  maturin
  python-maturin
)
pkgver=1.13.3
pkgrel=1
pkgdesc="Build and publish crates with pyo3, rust-cpython and cffi bindings"
url="https://github.com/PyO3/maturin"
arch=(x86_64)
license=('Apache-2.0 OR MIT')
makedepends=(
  git
  glibc
  libgcc
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
sha512sums=('2f18e5b56d3b47ff6171a5759da247e779859d46c055a230bd29ef50058f593f0f79e658ecf9cc0f1b3cecb4fc23c8fcf62a96133c3f81db356ff96d4cc81e71')
b2sums=('ed7d1ab08d82686a50de4b34e1a8999a380badb9bf2c91365f16297b050eb1c1b45eb4bed727267e88a8750d0c850563d6bb6907fcf6d24dbce84090bb65a8b5')

prepare() {
  cd $pkgbase
  # Fix issue with non-serialised test: https://github.com/PyO3/maturin/issues/3184
  git cherry-pick -n ea48b34e94e6d905339e6ffd2fc4ab7d3b96eaeb
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
    # https://github.com/PyO3/maturin/issues/3127
    --skip=write_dist_info_uses_license_file_sources
    # https://github.com/PyO3/maturin/issues/3128
    --skip=lib_with_target_path_dep_sdist
  )
  # Using --all-features here causes test failures due to:
  #   Cause: unsupported Zip archive: Unsupported compression level
  cargo test --frozen -- "${cargo_skip_args[@]}"
}

package_maturin() {
  depends=(
    libgcc
    glibc
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
