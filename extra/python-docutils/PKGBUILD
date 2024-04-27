# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=python-docutils
_name=${pkgname#python-}
pkgver=0.21.1
pkgrel=4
epoch=1
pkgdesc='Set of tools for processing plaintext docs into formats such as HTML, XML, or LaTeX'
arch=('any')
url='http://docutils.sourceforge.net'
license=('custom')
depends=('python')
makedepends=(
  'python-build'
  'python-flit-core'
  'python-installer'
)
checkdepends=('python-pillow')
optdepends=(
  'python-myst-parser: to parse input in "Markdown" (CommonMark) format'
  'python-pillow: for some image manipulation operations'
  'python-pygments: for syntax highlighting of code directives and roles'
)
source=("https://downloads.sourceforge.net/$_name/$_name-$pkgver.tar.gz")
b2sums=('a89792a69a7faa0eda7b2470e5e3a3d3cf8250a3577553a8f8f8d3d86d2693394e97dca6c75c1b4815748d2ce126ccd3f71dead5763ec8b70aee7be183165473')

prepare() {
  cd "$_name"-$pkgver
  # Remove include list https://github.com/pypa/wheel/issues/92
  sed -i '/^include =/,/]/d' pyproject.toml
}

build() {
  cd "$_name"-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"-$pkgver
  # we need utf locale to valid utf8 tests
  export LANG=en_US.UTF-8
  # Temporarily ignore missing test files
  PYTHONPATH="$PWD/build/python/" python test/alltests.py || true
}

package() {
  cd "$_name"-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/COPYING.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/COPYING.txt
}

# vim:set ts=2 sw=2 et:
