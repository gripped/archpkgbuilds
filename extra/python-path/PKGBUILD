# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-path
pkgver=16.15.0
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
sha512sums=('c8b7a9201ab8ce136155e06c788a60a16761e88ba64550fd34d74ce604f37f274db1ee61d6efeaef9482e1f98decd41293de6675f3985a64c7f59fecf461f101')

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
