# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=python-pynacl
pkgver=1.6.1
pkgrel=1
pkgdesc='Python binding to the Networking and Cryptography (NaCl) library'
arch=('x86_64')
url='https://github.com/pyca/pynacl'
license=('Apache-2.0')
depends=(
  'glibc'
  'libsodium'
  'python'
  'python-cffi'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pycparser'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-hypothesis'
  'python-pytest'
)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('77ea6ae114a6f4e980e59c291485e12fdc2a639803b7d6f521932bba041e1df12c9b394adead2240d99f3c726748446449068ce62896ee354f94949a1e0be34d')

build() {
  cd ${pkgname#python-}-$pkgver
  export SODIUM_INSTALL=system
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname#python-}-$pkgver
  export SODIUM_INSTALL=system
  python -m installer --destdir="$pkgdir" dist/*.whl
}
