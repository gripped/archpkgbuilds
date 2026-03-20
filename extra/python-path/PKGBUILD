# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-path
pkgver=16.16.0
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
sha512sums=('56fe239585585d1e76b9750f820fd61c80fbeb26397f5dcf1676f870e4edf81f5bf6acb55ad30c3bdf3666880b9de0edf7547aff208c83e78271f6a9c994a77b')

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
