# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=python-pyopenssl
pkgver=26.1.0
pkgrel=1
pkgdesc='Python wrapper around the OpenSSL library'
arch=(any)
url='https://pyopenssl.org/'
license=(Apache-2.0)
depends=(python python-cryptography)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-rerunfailures
  python-pretend
)
source=("$pkgname::git+https://github.com/pyca/pyopenssl#tag=$pkgver")
sha512sums=('48843dfef257cd9232c456f84233c3610e12cce76e0c41b8a21e3546520ace66838d0973319f74e46c88b176490976c5f616fb46037cff9e4cd5ebfa6bb0beb9')
b2sums=('5f07c8cee3330319a93d7b9f9345134b29b06b6af0c7be74ce4551470b32563754b452edf4491b3d63757b3548d1fd6dd3231582bd6d80aff96d70da36176688')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  local pytest_options=(
    -vv
    # TODO: Fix deselected tests failing due to throwing the wrong exception.
    --deselect tests/test_ssl.py::TestConnectionSendall::test_closed
    --deselect tests/test_ssl.py::TestConnection::test_shutdown_closed
    # https://github.com/pyca/pyopenssl/issues/1455
    --deselect tests/test_ssl.py::TestOCSP::test_client_receives_servers_data 
  )

  pytest "${pytest_options[@]}"
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim: ts=2 sw=2 et:
