# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs
_pyname=mitmproxy_rs
pkgver=0.12.16
pkgrel=1
pkgdesc="Python bindings for mitmproxy's Rust code"
arch=(x86_64)
url='https://github.com/mitmproxy/mitmproxy_rs'
license=(MIT)
depends=(
  glibc
  libgcc
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
sha512sums=('dc479249de18ba352129a95bf041a3e0727d6b15a90707cdf4538b2dbcc183d0e381fed87269f3d3bb0378db6b588b3d27177476fc6f2f30fe3ea3da95e13bad')
b2sums=('bfda2fc0f10d47be30c0e1f3e93fe79f23d52893998a213c7b94356c3d90fb0580a237da63978911a597909135adad57b688b3ffabc54c5a03cd13d0a9c018d0')

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
