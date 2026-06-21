# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=python-curl-adapter
pkgver=1.2.1
pkgrel=2
pkgdesc='A curl HTTP adapter switch for requests library — make browser-like requests with custom TLS fingerprints'
arch=(any)
url=https://github.com/el1s7/curl-adapter
license=(MIT)
depends=(
  python
  python-brotli
  python-curl_cffi
  python-eventlet
  python-pycurl
  python-requests
  python-urllib3
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
optdepends=('python-gevent: gevent support')
source=(git+https://github.com/el1s7/curl-adapter.git#tag=v${pkgver})
b2sums=('e9ce0b8d1e55c059a69482ba8d3430df6f1d5f409f960ac6eecb0331f612ab841d9ffd4cfed351d50403fe9bb8fa3fa9e0e29b796f350f93bf92a74b72d7dd63')

build() {
  cd curl-adapter
  python -m build --wheel --no-isolation
}

check() {
  cd curl-adapter
  pytest \
    --deselect tests/test_general.py::TestFunctions::test_ssl_verify \
    --deselect tests/test_general.py::TestFunctions::test_ssl_no_verify
}

package() {
  python -m installer --destdir="${pkgdir}" curl-adapter/dist/*.whl
  install -Dm 644 curl-adapter/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
