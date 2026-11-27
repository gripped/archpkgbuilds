# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-watchdog
pkgver=7.1.1
pkgrel=1
pkgdesc="Python API and shell utilities to monitor file system events"
arch=('any')
url="https://github.com/gorakhargosh/watchdog"
license=('Apache-2.0' 'PSF-2.0')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-flaky'
  'python-pytest'
  'python-pytest-timeout'
  'python-yaml'
)
optdepends=('python-yaml: for watchmedo')
source=("git+https://github.com/gorakhargosh/watchdog.git#tag=v$pkgver")
sha512sums=('0d9d76510dbbb957b358d3a9c2fda1853d46e8b2472fb88a3072f532afe03dc0079a12dcbb4913c00779e5e42a1ac7ecff7d036c622400b48e1d239182867ae7')

build() {
  cd watchdog
  python -m build --wheel --no-isolation
}

check() {
  cd watchdog
  python -m pytest
}

package() {
  cd watchdog
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 THIRD_PARTY_LICENSES.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
