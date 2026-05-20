# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-parver
pkgver=1.0
pkgrel=1
pkgdesc="Parse and manipulate version numbers"
url="https://github.com/RazerM/parver"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-pytest' 'python-hypothesis' 'python-pretend' 'python-pytest-xdist')
source=("git+https://github.com/RazerM/parver.git#tag=$pkgver")
sha512sums=('258c87a8121e0f2f3cb120def2756af98a7e0a54c56b629ea629d999a8bf6e30bf261d95752d6a834d76f2d6f35ceb88da327eacc5089cb8154fd5d6c0b62428')

build() {
  cd parver
  python -m build -nw
}

check() {
  cd parver
  PYTHONPATH=src pytest
}

package() {
  cd parver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
