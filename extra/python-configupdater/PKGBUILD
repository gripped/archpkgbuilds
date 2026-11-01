# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-configupdater
pkgver=4.0.2
pkgrel=1
pkgdesc="Parser like ConfigParser but for updating configuration files"
url="https://github.com/pyscaffold/configupdater"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-hatchling' 'python-hatch-vcs' 'python-build' 'python-installer')
checkdepends=('python-pytest')
source=("git+https://github.com/pyscaffold/configupdater.git#tag=v$pkgver")
sha512sums=('6d382979a960076de8a3941ed5c9991d7c220dd5d792bb573e0958ba2ffdfcd1df09717979682df38d23071ea7d891aa4a1bd01ef7f8ecd6346af9dfb28d0100')

build() {
  cd configupdater
  python -m build --wheel --no-isolation
}

check() {
  cd configupdater
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd configupdater
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
