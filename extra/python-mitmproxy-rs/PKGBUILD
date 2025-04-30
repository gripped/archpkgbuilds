# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs
_pyname=mitmproxy_rs
pkgver=0.12.3
pkgrel=1
pkgdesc="Python bindings for mitmproxy's Rust code"
arch=('x86_64')
url='https://github.com/mitmproxy/mitmproxy_rs'
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'python'
)
makedepends=(
  'bpf-linker'
  'cargo'
  'maturin'
  'python-installer'
  'rust-src'
)
options=(!lto)
source=("https://github.com/mitmproxy/mitmproxy_rs/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d5a5e3ad8f0f37f274057231b9b809e085e8d2aba6ce35fbd83fa41f7310414f')
b2sums=('f2dcc2c6b7c2fe722e3dd29abca355bde03efc4d632a69a0ce5e04b22021db1dad48dc0bd2f268d95796480b66e7dd4f1990a3d38a54d974e3e5da9f7705176c')

build() {
  cd ${_pyname}-${pkgver}/mitmproxy-rs
  maturin build --release --strip
  cd ../mitmproxy-linux
  RUSTC_BOOTSTRAP=1 maturin build --release --strip
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd ${_pyname}-${pkgver}
  for wheel in target/wheels/*.whl; do
    python -m installer --destdir=test_dir "${wheel}"
  done
  export PYTHONPATH="test_dir/${_site_packages}:${PYTHONPATH}"
  python -c 'import mitmproxy_rs'
}

package() {
  cd ${_pyname}-${pkgver}
  for wheel in target/wheels/*.whl; do
    python -m installer --destdir="${pkgdir}" "${wheel}"
  done
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
