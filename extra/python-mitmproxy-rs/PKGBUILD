# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs
_pyname=mitmproxy_rs
pkgver=0.10.7
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
sha256sums=('736bc1f8cb89d1fe2e0796c6e5ad2dd275e24a54c5f2498161292bf6b69973c4')
b2sums=('7de1bc8d3f4baa839733fc8d9c3c6b773e4ad6681c3a6163573e3c369bec2d32242b779480f1db6240ab979a4a5f43a755da6c514232ea4863adf33e18d210c0')

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
