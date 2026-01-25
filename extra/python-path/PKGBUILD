# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-path
pkgver=16.12.0
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
sha512sums=('2243f610865d7f831e99a59955f34cadabe8ae5000c25abf021858eb8fcc1e01f9ed219b7b5b8b8d5017be3c23a2b4cab83cc328103c437533cadc3138747c96')

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
