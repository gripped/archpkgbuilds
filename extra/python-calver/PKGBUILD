# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-calver
pkgver=2025.04.02
pkgrel=1
pkgdesc="Setuptools extension for CalVer package versions"
url="https://github.com/di/calver"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pretend')
source=("git+https://github.com/di/calver.git#tag=$pkgver")
sha512sums=('7cb2be6d4753fdc1ef82701f7e5c76909992158634d5e66f75eda08f2b7f1123abe2a5042b13c1517347afcbadff6c52b4910c422fdfe4ec4c423f21847ed405')

prepare() {
  cd calver
  echo "Version: $pkgver" > PKG-INFO
}

build() {
  cd calver
  python -m build --wheel --no-isolation
}

check() {
  cd calver
  mv PKG-INFO PKG-INFO.bak
  (
    # unset SOURCE_DATE_EPOCH to workaround test failures
    unset SOURCE_DATE_EPOCH
    PYTHONPATH="$PWD"/build/lib pytest
  )
  mv PKG-INFO.bak PKG-INFO
}

package() {
  cd calver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
