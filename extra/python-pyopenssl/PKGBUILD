# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=python-pyopenssl
pkgver=26.0.0
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
sha512sums=('df1cfecd4519d66fb2254cc01eb1b032c51c907abd51e48dd57e7fc768d738edf07ebd1a85c5adae0a62d5c0a95f126eb0f7a24554452c0876091e893363ab1a')
b2sums=('d9eb705cbdfa28d10d01ac0a98a9c4ba55b209c1818887d27227afadb04744937ccc48ff18b0d100e347ec2dc66bcb6b651f8778bc8dfcf2a205360d5049452b')

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
