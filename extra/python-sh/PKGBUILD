# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=python-sh
pkgver=2.2.3
pkgrel=1
pkgdesc='Subprocess interface that allows you to call any program as if it were a function'
arch=('any')
url='https://github.com/amoffat/sh'
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel'
             'python-poetry-core')
checkdepends=('lsof' 'python-pytest')
source=("git+https://github.com/amoffat/sh.git#tag=$pkgver")
sha512sums=('cb75988da40fa9dc9948fe0ec71bb8d0153d68b035205da293fe3463f8ccb954644a1b02e79cf4a292c20c39d12bc4538ff9bca6cb05c67caec45fc55642f62d')
b2sums=('f133c75e0009afd728081a128193ae04f6f5918543c80cce10957a88fecdbaf8e570e39bd541af6d587295b901fea061cfbbd584a276fa125e8b77a5282323ff')

build() {
  cd sh
  python -m build --wheel --no-isolation
}

check() {
  cd sh
  # export PYTHONPATH="$(pwd):${PYTHONPATH}"
  pytest tests -k 'not test_environment'
}

package() {
  cd sh
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -vDm644 {README.rst,CHANGELOG.md} \
    -t "$pkgdir"/usr/share/doc/$pkgname/
}

# vim:set ts=2 sw=2 et:
