# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs
_pyname=mitmproxy_rs
pkgver=0.12.9
pkgrel=1
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
sha512sums=('04874917e053866ec0a09fc47f03a3bea457061f107baad8cfa6e5331a21defd87d18ea58b42216bd844263ebc04e6e297a147de622644f0deb3bd405988d1a5')
b2sums=('adb3308cde8c8a3fcb6f52e4f73f344a839e35f54099a395aac722265c95eeada45fe2d2815b1010f718a7973753268bb675dc00b915876638bf555e94a7bea0')

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
