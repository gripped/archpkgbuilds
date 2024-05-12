# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=python-pytools
pkgver=2024.1.1
pkgrel=1
pkgdesc="A collection of tools for Python"
arch=('any')
url="https://github.com/inducer/pytools"
license=('MIT')
depends=('python-numpy' 'python-platformdirs' 'python-typing_extensions')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
source=("git+https://github.com/inducer/pytools.git#tag=v$pkgver")
sha512sums=('68150024bb022919e5080a42df3953d694049a602aaabe0d794d14723ddb9d450215e4ee00de180d65b6c6eb91935c51f5a735cc91af1689854655f80000d9b5')

build() {
  cd pytools
  python setup.py build
}

check() {
  cd pytools
  python -m pytest
}

package(){
  cd pytools
  python setup.py install --prefix=/usr --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
