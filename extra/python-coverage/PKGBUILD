# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.13.1
pkgrel=1
pkgdesc="A tool for measuring code coverage of Python programs"
arch=('x86_64')
url="https://coverage.readthedocs.io/en/latest/"
license=('Apache-2.0')
depends=('glibc' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nedbat/coveragepy/archive/$pkgver.tar.gz")
sha512sums=('45c88e5dc465aa956db85566249d799c0b98828fdfbedb3aebca3e09da30bd1bbc3844e0ffd47bf4205c24536936a836e3cfb890142bc79cfffcac4ac370265f')
b2sums=('a0bc994deb1815a032136544ab172acb34394fb595b975b47c5d5f273620ea2bc10c63b9d5277a0ffe7b0652f82207997171dcbf452ffeae0cce94b51589596f')

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
