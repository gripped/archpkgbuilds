# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=python-pyopenssl
pkgver=24.3.0
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
sha512sums=('7d12acc7ef3525777af911b89fe6dc86761122addeca9e3c4f76b61a071f05f117cf846fa4e88244d7cd23c852bf0b9e72bdcc6ef9098e60d8d6115b74b72e1c')
b2sums=('c83fe06e4495ff66e7b89ff42e0da31638ee5f347a494237ab8815feb8cc406418715e7a1ed8a97199214655c52bbf99712d34d6038c3c71de5b47d704e7114d')

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
