# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-path
pkgver=16.13.0
pkgrel=1
pkgdesc='A module wrapper for os.path'
arch=('any')
license=('MIT')
url='https://github.com/jaraco/path'
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
replaces=('python-path.py')
conflicts=('python-path.py')
provides=('python-path.py')
source=("git+https://github.com/jaraco/path.git#tag=v$pkgver")
sha512sums=('c9d22936bf1ba26a1718ae4f2891d6e577ebeb6e33cf10f05a2c0e2800e9dabda1f193b59361fc7d3ef5ae3c70bbd487bc088cc4893b58b3c32ff1beff601a85')

build() {
  cd path
  python -m build --wheel --no-isolation
}

check() {
  cd path
  python -m pytest
}

package() {
  cd path
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
