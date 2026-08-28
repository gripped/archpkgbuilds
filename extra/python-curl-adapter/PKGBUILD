# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=python-curl-adapter
pkgver=1.2.2
pkgrel=1
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
b2sums=('e22957755d8c3ed112b6b8b35f8020c5119c359ff2e60fc0c6a72b05640de30e887e79efc0ee054e78970e77568e50c87432691e41138d2c45056656abcbd3a4')

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
