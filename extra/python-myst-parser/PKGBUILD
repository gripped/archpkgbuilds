# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=MyST-Parser
pkgname=python-myst-parser
pkgver=3.0.0
pkgrel=2
pkgdesc='An extended commonmark compliant parser, with bridges to docutils/sphinx'
arch=('any')
url='https://github.com/executablebooks/MyST-Parser'
license=('MIT')
depends=('python' 'python-docutils' 'python-jinja' 'python-markdown-it-py' 'python-mdit_py_plugins' 'python-pygments' 'python-sphinx' 'python-yaml')
optdepends=('python-linkify-it-py: linkify support')
makedepends=('python-build' 'python-installer' 'python-flit-core' 'python-wheel')
checkdepends=('python-beautifulsoup4' 'python-linkify-it-py' 'python-pytest' 'python-pytest-param-files' 'python-pytest-regressions' 'python-sphinx-pytest')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a91abfcb99b9b53cee6877d469c32a95c69c2fcbc9cfe6217451c0995e49dec89fe98cd5a1a5e408845985a10fbc21d4e3d8063f1d7a3d96781cb44352b3e806')

build() {
  cd $_pkgname-$pkgver

  python -m build -wn
}

check() {
  cd $_pkgname-$pkgver

  python -m pytest \
    -k 'not test_sphinx_builds and not fixtures and not test_myst_config and not test_myst_refs' \
    --disable-warnings
}

package() {
  cd $_pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
