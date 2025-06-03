# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgbase=maturin
pkgname=(
  maturin
  python-maturin
)
pkgver=1.8.6
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
checkdepends=(
  python-cffi
  python-pycparser
  python-virtualenv
)
# Disable LTO until ring can be built with it:
# https://github.com/briansmith/ring/issues/1444
options=(!lto)
source=(
  "$pkgname::git+$url.git#tag=v$pkgver"
  "https://raw.githubusercontent.com/AerynOS/recipes/aef489e1845f2914d43bfd66cf91c5da0528efee/m/maturin/pkg/0001-Revert-Add-compression-level-option-to-build-command.patch"
)
sha512sums=('b2cc87a10606b8f2f69830643713ff94b8893bc1d95087f9760f62bfa623bec22f6d5acb8b220e4a71c8ae04c5dfb30f5eead4860575c669d3ed1f2c0f29acda'
            'daf095bd9cc5ad84da3d79462b19cf1ce571ee3ff539dd2aa8c20514580ae6d4def7e2e818807d71fcbc90f0c2c36762135bdcfb442b93f873f3952d50ec7336')
b2sums=('68d2a5fa6105cba121606d2de4da7bfb6c235a2a8d8b51dbb3254d1a41c7fb934d22190cfd5913184b97f3cb70ec5dfd89f7660151a08317c949e0856d47aa51'
        'fdbf0ef27e25db27f3dfb8d12362a7a861b1ab827aff568ef5ace2f05849bc56a8ec9a6cd0510a2faefa54df998e8903f867a5ede2a0246d86364bfadde0fd91')

prepare() {
  cd $pkgbase
  # Revert https://github.com/PyO3/maturin/pull/2572/commits
  # Causes test failures, see:
  # https://github.com/PyO3/maturin/discussions/2608
  patch -Np1 < ../0001-Revert-Add-compression-level-option-to-build-command.patch

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgbase
  MATURIN_SETUP_ARGS="--frozen --all-features" \
    python -m build --wheel --no-isolation
}

check() {
  cd $pkgbase
  mkdir -p test-crates/venvs
  local cargo_skip_args=(
    # Requires wasm32-wasip1 target
    --skip=integration_wasm_hello_world
    # Fails with the following error, not sure why:
    # AttributeError: module 'uniffi_pure_proc_macro' has no attribute 'add'
    --skip=integration_uniffi_pure_proc_macro
  )
  cargo test --frozen --all-features -- "${cargo_skip_args[@]}"
}

package_maturin() {
  depends=(
    bzip2
    gcc-libs
    glibc
    openssl
    rust
  )

  cd $pkgbase
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -vr "$pkgdir/usr/lib"
  install -vDm 644 {Changelog,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 license-mit -t "$pkgdir/usr/share/licenses/$pkgname/"
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
  rm -vr "${pkgdir:?}/usr/bin"
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" license-mit
}
