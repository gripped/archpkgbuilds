# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-elementpath
pkgver=5.0.2
pkgrel=1
pkgdesc="XPath 1.0/2.0 parsers and selectors for ElementTree and lxml"
url="https://github.com/sissaschool/elementpath"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-lxml' 'python-pytest' 'python-xmlschema')
source=("git+https://github.com/sissaschool/elementpath.git#tag=v$pkgver")
sha512sums=('7508c23c7412a63e49954abe775a1149462db287b66de37545b722cd9d0c79dbd71e7dab1b12e94df0d42315c79925edbb5aaeffdb2637acdad4f11a973834cc')

build() {
  cd elementpath
  python -m build -nw
}

check() {
  cd elementpath
  python -m pytest
}

package() {
  cd elementpath
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
