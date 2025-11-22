# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.12.0
pkgrel=1
pkgdesc="A tool for measuring code coverage of Python programs"
arch=('x86_64')
url="https://coverage.readthedocs.io/en/latest/"
license=('Apache-2.0')
depends=('glibc' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nedbat/coveragepy/archive/$pkgver.tar.gz")
sha512sums=('d1a78773450c010d4c252f9e64562e0ad4a4178929399a9cf1b2beeba1c905e7abb06ca5b810d031545fd9de49cd93dcef3d4b8d8726e1f7efa4877e312d820e')
b2sums=('a0522b29fba3b980e0edd523b435f7fc2dec8ab964ca42c3a81c171adcd5a10b7e0b8559925bb5d2ec8a132cb9eb9a438f43cb75f737184445f8e6071319d84b')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  # Upstream test suite doesn't currently run in our build environment.
  cd $_pkgname-$pkgver
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
}
