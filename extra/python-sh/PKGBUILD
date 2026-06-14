# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=python-sh
pkgver=2.2.5
pkgrel=1
pkgdesc='Subprocess interface that allows you to call any program as if it were a function'
arch=('any')
url='https://github.com/amoffat/sh'
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer'
             'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/amoffat/sh.git#tag=$pkgver")
sha512sums=('ddf624cbcd2a5eb6318570d5faf09e7d0fd42648065db4d2abcfc794e7af22b759da60b2a33fe1d547388fe7eaf7dbc26d851bf33eb49bccef422f35ce0949bc')
b2sums=('d4c1fc6ce99d7bc92cdff1e3da18958f1e586970b2924572ce6fce44ee97207f89daaad4c822eceb91bc0a3b26b5ea67ac674e3b9db1fcdc460f35d3c426d849')

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
