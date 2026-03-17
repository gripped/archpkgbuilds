# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pypandoc
pkgver=1.16.2
pkgrel=1
pkgdesc="Thin wrapper for pandoc"
arch=('any')
license=('MIT')
url="https://github.com/JessicaTegner/pypandoc"
depends=('pandoc')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
checkdepends=('texlive-basic' 'texlive-latexextra' 'texlive-fontsrecommended' 'python-pandocfilters')
source=("git+https://github.com/JessicaTegner/pypandoc.git#tag=v$pkgver")
sha512sums=('8cf029152894cdc507aaf45aaabe6dfa90558a7fd21c9a6c4a098a71801f67f2aea9e760f27a8c8abcad8ff153a94e5557929ae657379d754062f389135fe52d')

build() {
  cd pypandoc
  python -m build -wn
}

check() {
  cd pypandoc
  # https://github.com/NicklasTegner/pypandoc/issues/278
  python tests.py || echo "Tests failed"
}

package() {
  cd pypandoc
  python -m installer -d "$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
