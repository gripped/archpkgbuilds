# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-configupdater
pkgver=3.1.1
_commit=0539c207ac57ea4fa6a64618e41b987c5865ffd9
pkgrel=5
pkgdesc="Parser like ConfigParser but for updating configuration files"
url="https://github.com/pyscaffold/configupdater"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools-scm' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/pyscaffold/configupdater.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  sed -i '/--cov configupdater/d' configupdater/setup.cfg
}

build() {
  cd configupdater
  python -m build --wheel --no-isolation
}

check() {
  cd configupdater
  PYTHONPATH="$PWD"/build/lib pytest
}

package() {
  cd configupdater
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
