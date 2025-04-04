# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-path
pkgver=16.10.2
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
sha512sums=('376f6051566e8eff573d4f097d70545d627ead5504667c2d41806eb82ef981f18aa2966d93062111c23df4c00c78466d97c1d96c2d1de93a687ceed374f658d5')

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
