# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=python-cogapp
pkgver=3.6.1
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
sha512sums=('86b96fde15184c471b0dd8bee06fe72c8f67b7c7c59d8ae0601598f8846572d931770cbaf6bce3e0e5bcdaa754b833a6f6daf1a0073417bba3655e888ca19f78')

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
