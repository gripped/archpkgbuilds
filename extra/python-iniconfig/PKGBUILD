# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-iniconfig
pkgver=2.2.0
pkgrel=1
pkgdesc="brain-dead simple config-ini parsing"
url="https://github.com/pytest-dev/iniconfig"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("git+https://github.com/pytest-dev/iniconfig.git#tag=v$pkgver")
sha512sums=('e999a70a4c26e95f6cf240780bb9168da3843daf28c9122e25a512f24ff4e5e1dd1fd476bc179ce5109f3d1775a3ef1e2bbec0f4692383689a1c9b02ecd7204d')

build() {
  cd iniconfig
  python -m build -nw
}

check() {
  cd iniconfig
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd iniconfig
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
