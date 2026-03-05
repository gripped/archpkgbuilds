# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pypandoc
pkgver=1.16
pkgrel=1
pkgdesc="Thin wrapper for pandoc"
arch=('any')
license=('MIT')
url="https://github.com/JessicaTegner/pypandoc"
depends=('pandoc')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
checkdepends=('texlive-basic' 'texlive-latexextra' 'texlive-fontsrecommended' 'python-pandocfilters')
source=("git+https://github.com/JessicaTegner/pypandoc.git#tag=v$pkgver")
sha512sums=('2a3f155f2d11c644f9f022273a7306ff81c97b8db39b7e8ef4dd4558e02ffda49c8545f43f9a74efc29f99ff2af3eadc0d3540a8ecc6dd9079c441b618106139')

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
