# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=python-pyopenssl
pkgver=25.3.0
pkgrel=2
pkgdesc='Python wrapper around the OpenSSL library'
arch=('any')
url='https://pyopenssl.org/'
license=('Apache-2.0')
depends=('python' 'python-cryptography')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest' 'python-pretend' 'python-pytest-rerunfailures')
source=("$pkgname::git+https://github.com/pyca/pyopenssl#tag=$pkgver")
sha512sums=('519e2ac290688b488c78359a90e938138fb0d5cf1c82442470d46e83e8605eb2be5a065f96cb46c847f76e172fbce0adfd9e0247dc73b6e18fefea5425193699')
b2sums=('b3ad0d96b739cb48b2811d9baea297cb0f2c5e2693bdccca17c7d8c7b6651b94c7bd16edf0e1e6520c6ed89712a7d190c91d3b860bd28230413a6d6c9e20d0bf')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  # TODO: Fix deselected tests failing due to throwing the wrong exception.
  PYTHONPATH="$PWD"/build/lib pytest -v \
    --deselect tests/test_ssl.py::TestConnectionSendall::test_closed \
    --deselect tests/test_ssl.py::TestConnection::test_shutdown_closed \
    --deselect tests/test_ssl.py::TestOCSP::test_client_receives_servers_data # https://github.com/pyca/pyopenssl/issues/1455
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim: ts=2 sw=2 et:
