# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs
_pyname=mitmproxy_rs
pkgver=0.5.2
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
  'cargo'
  'maturin'
  'python-installer'
)
options=(!lto)
source=("https://github.com/mitmproxy/mitmproxy_rs/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('58efda8478d227cc57351e9ab241442c9a8a4d103a17107b01d9add1e786c07a')
b2sums=('3c81352870d3dba181bc4bddfa038ecc3c50d6de13aacdc17736b846bb06e35fc8271a25511465ce2adc135de15659a4b6e0780be74f2efae64bffb705a55d06')

build() {
  cd ${_pyname}-${pkgver}/mitmproxy-rs
  maturin build --release --strip
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd ${_pyname}-${pkgver}
  python -m installer --destdir=test_dir target/wheels/*.whl
  export PYTHONPATH="test_dir/${_site_packages}:${PYTHONPATH}"
  python -c 'import mitmproxy_rs'
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="${pkgdir}" target/wheels/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
