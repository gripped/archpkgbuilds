# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs
_pyname=mitmproxy_rs
pkgver=0.6.2
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
sha256sums=('734d86f6fe25e46ae627b10212ffbf66e7aa462784f4b238f4a4599764d6bab2')
b2sums=('d578b6d9de9d6c1c0ad3bd225ff1a928bb5589d222b3ef011c7b2d752354c74cbf84081aaed4910ef4647be0caaf9e4a8f4b247bbba17a540a8a353e1def46b6')

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
