# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=python-cogapp
pkgver=3.4.0
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
sha512sums=('03e429f0be149d715daa04144b2c6e40e9703de4a0792b82c74428ff633fedbfe47a81dab85c935260b4e1aabaa59bab663376dbf0f44a900c2d1c39472f89c5')

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
