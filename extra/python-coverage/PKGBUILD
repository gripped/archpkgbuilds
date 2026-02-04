# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.13.3
pkgrel=1
pkgdesc="A tool for measuring code coverage of Python programs"
arch=('x86_64')
url="https://coverage.readthedocs.io/en/latest/"
license=('Apache-2.0')
depends=('glibc' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nedbat/coveragepy/archive/$pkgver.tar.gz")
sha512sums=('8fed657964d0de17850a45b023fa87d7c4f430bcc4ab3bc49835982524b035f4dff53ad05f294c3d0aac77ada9e823d1849270489220320fddd503abebd88ec4')
b2sums=('f9fb4608476da8f7f92ee841d7d3dcf2b919980fb3c6a686a4a2d7e78150a32efd39c4d9f3a7c11f1ccd429f28ddd05c2413f13416bc881075c6e220f1c3818e')

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
