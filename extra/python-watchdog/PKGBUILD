# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-watchdog
pkgver=7.1.0
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
sha512sums=('d8e0d6fe88c5f4594ae04171d8c1a151cdcd1b5d1c2326e4fe4e0f77144906a5f27bbd488de4ae580cd666b36df7cd148e1910c00b967d0f98bd3672ebc94453')

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
