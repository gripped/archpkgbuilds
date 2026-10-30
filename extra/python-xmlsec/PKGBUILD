# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-xmlsec
pkgver=1.3.18
pkgrel=1
pkgdesc="Python bindings for the XML Security Library"
url="https://github.com/mehcode/python-xmlsec"
license=('MIT')
arch=('x86_64')
depends=('glibc' 'libxml2' 'python-lxml' 'xmlsec')
makedepends=('git' 'python-build' 'python-installer' 'python-pkgconfig' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-hypothesis' 'python-pytest')
source=("git+https://github.com/mehcode/python-xmlsec.git#tag=$pkgver")
sha512sums=('b6d2e24eb16b8100c3768f40deb714ba3a16865f4771b74c693e4a92dccbe8c2aac4099e7811e9818925774e1052aca53cc5895151477498d08fd6f88ea72090')
options=(!makeflags)

build() {
  cd python-xmlsec
  python -m build --wheel --no-isolation
}

check() {
  cd python-xmlsec
  python -m venv --system-site-packages --without-pip test-env
  test-env/bin/python -m installer dist/*.whl
  # Isolate process-final OpenSSL cleanup from pytest's Hypothesis summary hook.
  # https://github.com/xmlsec/python-xmlsec/pull/422
  test-env/bin/python -m unittest tests.test_xmlsec.TestModule.test_init_shutdown_module
  test-env/bin/python -m pytest --deselect tests/test_xmlsec.py::TestModule::test_init_shutdown_module
}

package() {
  cd python-xmlsec
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
