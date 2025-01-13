# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs
_pyname=mitmproxy_rs
pkgver=0.11.4
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
sha256sums=('f47ffe8ac94bba65eda67e66633c255d7023f4236af853b4562684843cca476c')
b2sums=('85ccfffdcd68c507fdbb5c67ff1af9d90f1dbe292260d77b985822dba940a097fc0e4e83347497d59e4f8fed3fd4f35fd60c3a7cf5308b893ba9e7ff1b30a30a')

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
