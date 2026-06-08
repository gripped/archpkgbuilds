# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=python-sh
pkgver=2.2.4
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
sha512sums=('26b1f7c4ba3b19c9960daea293ed72aee8b717bfc55e239dc98109cbb952cb47b85c133e5eef234da6b6b551042642aef9c047aabc7bfe7da5addb12d0087d51')
b2sums=('6512b4bc0f80b5e3772298b3c07e3c94f316d1a55cc84e1fb303580419084e8648df2edfb4b76952be368cf0f39815e342ef5104d8faa42567e1f09c5d806baa')

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
