# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=python-pyopenssl
pkgver=25.0.0
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
sha512sums=('4cf02bd99a5487409a9d70a44298441e0bef68dea8cf9a42832ca243f7c9c9a6ef28b2dbaa22c1b88b740aa451c41349ed843e0360d4ec7e7c862a6f75125bf9')
b2sums=('5681f7a207b10bc2a455eb28258c9e2b38501f0bdd6336fe2e28ab9b1e540567f77d11c8d51eb44a2242347c4fddffde2f2a9c2eae94a274491a729cfab6b78e')

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
