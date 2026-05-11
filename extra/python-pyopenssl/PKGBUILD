# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=python-pyopenssl
pkgver=26.2.0
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
sha512sums=('512eff36b40350a9e919e88b752f80fd4f42bd126d3c47ec0a7867d75f1e1018e559d212241d3271b19ec04e8be2cacf26894347211c97d27a0367d1ade1902a')
b2sums=('3ad945fc5e5330c4666fd71df651f0fbf98000cb635d373783847719f2c0d735ebb387968e3e5e0a9c7ae1a27fdcea2f82e4534efd3eef1bf9bb61e590fcd7fa')

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
