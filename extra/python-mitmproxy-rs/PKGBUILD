# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs
_pyname=mitmproxy_rs
pkgver=0.12.8
pkgrel=2
pkgdesc="Python bindings for mitmproxy's Rust code"
arch=(x86_64)
url='https://github.com/mitmproxy/mitmproxy_rs'
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
)
makedepends=(
  git
  bpf-linker
  rustup
  maturin
  python-installer
  rust-src
)
options=(!lto)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('0a028e66b0dfc911b0b8b31094f051e025f80736193eeb2f9b8c3eeca83455401db4b6ba75a5e8b7fa4d451e2d748f1b9998ea380491a10e889f28a9cdd908db')
b2sums=('1b10cde792351cdd30474852a69ecb7707a9db4a4c3fca72f4906549804cf4f2fa88406dd3f86b90b2672da18c5aa89f5e507a566e5837a25b1c44c9e5157356')

build() {
  cd "$pkgname"

  export RUSTUP_TOOLCHAIN=nightly
  rustup component add rust-src --toolchain "nightly-${CARCH}-unknown-linux-gnu"

  pushd mitmproxy-rs
  maturin build --release --strip
  popd
  
  pushd mitmproxy-linux
  RUSTC_BOOTSTRAP=1 maturin build --release --strip
  popd
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "$pkgname"
  for wheel in target/wheels/*.whl; do
    python -m installer --destdir=test_dir "${wheel}"
  done
  export PYTHONPATH="test_dir/${_site_packages}:${PYTHONPATH}"
  python -c 'import mitmproxy_rs'
}

package() {
  cd "$pkgname"
  for wheel in target/wheels/*.whl; do
    python -m installer --destdir="${pkgdir}" "${wheel}"
  done

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et:
