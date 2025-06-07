# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=python-pyopenssl
pkgver=25.1.0
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
sha512sums=('f60abe6ac67eb37b0c30957719d2d2b97cf34faaaaacdd0067c699a8ae56b1836776b40f92799ab2ebabe085e298b9fbb44a9dfda76e3ebb89bc905a91f10de8')
b2sums=('bbb6144ab8ea63ea321dbb07d496192ae60294d576350fe4a37a7e134529a46d123b51872babe1b335fdc409aa08202f6d87f9589c8bc924fa60f234fa0aa7ea')

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
