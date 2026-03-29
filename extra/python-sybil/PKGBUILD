# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sybil
pkgver=7.0.0
pkgrel=1
pkgdesc='Automated testing for the examples in your documentation.'
arch=('any')
license=('MIT')
url='https://github.com/simplistix/sybil'
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-seedir' 'python-testfixtures' 'python-yaml')
source=("git+https://github.com/simplistix/sybil.git#tag=$pkgver")
sha512sums=('f7537185717c9ec9269f7a1e92360c44e8ddb8dc63623424128ae849b0b5128b447b6754c033c634a13d7aef3946095954ec57ca22280f0400a673c5a0393ec0')

prepare() {
  cd sybil
  # Python 3.14 compatibility for sybil/document.py (ast.Str removal)
  sed -i 's/^from ast import AsyncFunctionDef, FunctionDef, ClassDef, Module, Expr, Constant, Str$/from ast import AsyncFunctionDef, FunctionDef, ClassDef, Constant, Module, Expr/' sybil/document.py
  sed -i 's/if isinstance(docstring, Str):/if isinstance(docstring, Constant):/' sybil/document.py
  sed -i 's/text = docstring.s/text = docstring.value/' sybil/document.py
}

build() {
  cd sybil
  python -m build --wheel --no-isolation
}

check() {
  cd sybil
  python -m pytest
}

package() {
  cd sybil
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
