# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=python-cogapp
pkgver=3.4.1
pkgrel=1
pkgdesc="A code generator for executing Python snippets in source files"
url="https://nedbatchelder.com/code/cog"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
conflicts=('cocogitto')
source=("git+https://github.com/nedbat/cog.git#tag=v$pkgver")
sha512sums=('a2c9127e606f9b0c55e1c826ea76029ea350109d2c0e88618ba8c70c1074efc2134a0d082fd5dac3be164692c3dec0aecbef4cb1ff7712ef9d647000b8280c9f')

build() {
  cd cog
  python -m build -wn
}

check() {
  cd cog
  pytest
}

package() {
  cd cog
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
