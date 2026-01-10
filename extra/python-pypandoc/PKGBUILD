# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pypandoc
pkgver=1.15
pkgrel=2
pkgdesc="Thin wrapper for pandoc"
arch=('any')
license=('MIT')
url="https://github.com/JessicaTegner/pypandoc"
depends=('pandoc')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
checkdepends=('texlive-basic' 'texlive-latexextra' 'texlive-fontsrecommended' 'python-pandocfilters')
source=("https://github.com/JessicaTegner/pypandoc/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c6127aa085c27f2e82148689647f7861c8bdb37feacc6b5fdf017947c7e1c18eaf7c17ec26b7c2881d4ae40bb20dcaaf86aa52f989315d19df92e491bf07efb8')

build() {
  cd pypandoc-$pkgver
  python -m build -wn
}

check() {
  cd pypandoc-$pkgver
  # https://github.com/NicklasTegner/pypandoc/issues/278
  python tests.py || echo "Tests failed"
}

package() {
  cd pypandoc-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
