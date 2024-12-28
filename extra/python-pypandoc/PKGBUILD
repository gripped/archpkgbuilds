# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pypandoc
pkgver=1.14
pkgrel=2
pkgdesc="Thin wrapper for pandoc"
arch=('any')
license=('MIT')
url="https://github.com/JessicaTegner/pypandoc"
depends=('pandoc')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
checkdepends=('texlive-basic' 'texlive-latexextra' 'texlive-fontsrecommended' 'python-pandocfilters')
source=("https://github.com/JessicaTegner/pypandoc/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('f3ad3b14e45726de47cdd251a988cb377dad41f33a4569e9c051ff6d4d13a7688b23221972140b97fba5160575a02e115d4bf22861d0472931142bb24534646b')

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
