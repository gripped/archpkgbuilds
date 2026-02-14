# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.13.4
pkgrel=1
pkgdesc="A tool for measuring code coverage of Python programs"
arch=('x86_64')
url="https://coverage.readthedocs.io/en/latest/"
license=('Apache-2.0')
depends=('glibc' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nedbat/coveragepy/archive/$pkgver.tar.gz")
sha512sums=('2666eef24c45eb0711e956fb924e1f0a9f6dc9364076a5721ad822316d3ca7ef6616b4f32d40e12abff9d9675accb1c9e37fa83e33018900123a47245dea879f')
b2sums=('219a663c1546b074ed9ace96ca3ae758544fe291d2df5c694521f159c2d5872883b8ba03ba2aa1a028cefb67d90cd348c1c2125123597fd155aa21c7bb55c07a')

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
