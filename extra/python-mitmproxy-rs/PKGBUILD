# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs
_pyname=mitmproxy_rs
pkgver=0.9.3
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
source=("https://github.com/mitmproxy/mitmproxy_rs/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b4399750d72298f9b159aa76ac50f6196e59d200849e82d3fc07ae944ac911b8')
b2sums=('5b0ba89a77365630e3d08f4a82bcf31ce18f962198f7efcefa7d05c921b88450babee0f9cb41bfc7bb1c2dcd61ad6b1ed597aec52664c9e912dbeaba24bc49e1')

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
