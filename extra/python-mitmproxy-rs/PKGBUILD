# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs
_pyname=mitmproxy_rs
pkgver=0.12.10
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
sha512sums=('dbcf2e440ebc321ad5d187bd98ab03b49518ca4b5621cf85824f99f519d462f980ffe1ecceb12e1bc3b0191af97135cbfb163ba3a6774b166ad4218408ed6db7')
b2sums=('b0f68280cd6f36ebd3077b98a96ce5c07db1864f2308d25f50660489e6a175e54ed2408a193c1feebe5f8ed48bd9b6e234e7da3781f5d9e0c4c2d6208a2336b7')

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
