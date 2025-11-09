# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.11.2
pkgrel=1
pkgdesc="A tool for measuring code coverage of Python programs"
arch=('x86_64')
url="https://coverage.readthedocs.io/en/latest/"
license=('Apache-2.0')
depends=('glibc' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nedbat/coveragepy/archive/$pkgver.tar.gz")
sha512sums=('0bdf97f93a39e164835744b091a76907bbc0b4d56e0887e9c71e880b82f97f6d9869c606c39ccdee2f9a468215ce02dc898df6b6e4c405959a54122ed3405d6e')
b2sums=('f80ad8a9eb6d153b369937d81b20719ac650620fc1a5162b338c2b0478e19d77b9999dc5b43ffcb7335c21210fedfad9c8dab441e3944fca884fc805b5c4d880')

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
