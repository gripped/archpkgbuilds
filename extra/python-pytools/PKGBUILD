# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=python-pytools
pkgver=2024.1.6
pkgrel=1
pkgdesc="A collection of tools for Python"
arch=('any')
url="https://github.com/inducer/pytools"
license=('MIT')
depends=('python-numpy' 'python-platformdirs' 'python-typing_extensions')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
source=("git+https://github.com/inducer/pytools.git#tag=v$pkgver")
sha512sums=('e43998ae59e120def3d823f916c12e1a99453e7772311e841f6fda8d268ead5fca652156b9f9fcf910c297e9b53a0363a707402ee2237a775ad55487fd0fb006')

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
