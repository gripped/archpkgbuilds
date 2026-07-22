# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs
_pyname=mitmproxy_rs
pkgver=0.12.11
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
sha512sums=('4867c14a1b926c4df4d16e099786bc4e21342ca49df2c2830c80954cafd08b8dc45e16586fbac260f5a7d9db808fed94db99353b1fd534a2d224f9f175f8288a')
b2sums=('5629de33f84291df01595bed3aae9dd3f4e27a079f5297b5c96d74f24eb9387e2ba7a21318b4eceffdf997315a8b8cee9a8949dcf3e1bfcf393d7fcfbd010e98')

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
