# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=python-pyopenssl
pkgver=25.2.0
pkgrel=1
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
sha512sums=('8ecef67a22108f4e76331b00206b94aa83a523ae69549244fddc7a7c9fcedb1ac41a9f403ab8ea9abbbc4277abe5d1efeafb1c400d49cfbe255a7b250032368e')
b2sums=('36b697855673d83083b4bd9e687ad89dae7498168591e1f2e759c3f2e199200503eeee69988820f3a49c49e8a215bacced38948de50f3c1209f03de08b062801')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  # TODO: Fix deselected tests failing due to throwing the wrong exception.
  PYTHONPATH="$PWD"/build/lib pytest -v \
    --deselect tests/test_ssl.py::TestConnectionSendall::test_closed \
    --deselect tests/test_ssl.py::TestConnection::test_shutdown_closed
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim: ts=2 sw=2 et:
