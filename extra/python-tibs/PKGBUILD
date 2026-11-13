# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pyname=tibs
pkgname=python-${_pyname}
pkgver=0.5.7
pkgrel=1
pkgdesc='Python library for binary data: fast bit arrays, bitfields and bitsets'
url='https://github.com/scott-griffiths/tibs'
arch=(x86_64)
license=(MIT)
depends=(
  glibc
  libgcc
  python
)
makedepends=(
  cargo
  python-build
  python-installer
  python-maturin
)
checkdepends=(
  python-hypothesis
  python-pytest
  python-pytest-benchmark
)
options=(!lto)
source=(
  "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha512sums=('85447e10cf6e44ee3837b7fcd6979d0395c63fbe065a2020e9f5c8597d919e39e7785c0896615383f1f65e801ff9080850fc51214375a29573a030faa4e49aad')
b2sums=('1a7f71bf4737ea6211b44a1eb33bb02a81772d97401ab36cc300a8c8ba5ea5c5118462f73523e47326c813598c474dd0d08629f0d9f5578240978f85cc75b93b')

prepare() {
  cd ${_pyname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${_pyname}-${pkgver}
  export CARGO_NET_OFFLINE=true
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pyname}-${pkgver}
  python -m venv --clear --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -Pm pytest tests --benchmark-disable
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
