# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-calver
pkgver=2025.04.17
pkgrel=1
pkgdesc="Setuptools extension for CalVer package versions"
url="https://github.com/di/calver"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pretend')
source=("git+https://github.com/di/calver.git#tag=$pkgver")
sha512sums=('e398dc781d235e8a497a1ac5eacbc13ff23d3f4143957a157ae5e649437015c72423528fa5417c0d875cfa131c171090904a539bfa3a64ccef790de05220932d')

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
  PYTHONPATH="$PWD"/build/lib pytest
}

package() {
  cd calver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
