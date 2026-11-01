# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-watchdog
pkgver=7.0.0
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
sha512sums=('2d842de15ee89e32ec4e5d68ed1eb93f40c708951394aff4deb74f6000c74f62e430320095cc46327f85f29c6ae0b896cb41bfc20626bbe5e566e75a70b811f9')

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
