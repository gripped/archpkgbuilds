# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs
_pyname=mitmproxy_rs
pkgver=0.3.0
pkgrel=1
pkgdesc="Python bindings for mitmproxy's Rust code"
arch=('x86_64')
url='https://github.com/mitmproxy/mitmproxy_rs'
license=('MIT')
depends=('python')
makedepends=('maturin' 'python-installer' 'cargo')
options=(!lto)
source=("https://github.com/mitmproxy/mitmproxy_rs/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('cf6fdd9419fe4e404c8db796b2d5bb1225d79e6c2d3a40876fed4496ff9c1952aec19a17d1924537d8611e845f029a98582a03d983ffeb46cb9e39df2718102c')

build() {
  cd ${_pyname}-${pkgver}/mitmproxy-rs
  maturin build --release --strip
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd ${_pyname}-${pkgver}
  python -m installer --destdir=test_dir target/wheels/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  python -c 'import mitmproxy_rs'
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" target/wheels/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
