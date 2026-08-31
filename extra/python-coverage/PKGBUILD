# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.14.2
pkgrel=1
pkgdesc="A tool for measuring code coverage of Python programs"
arch=('x86_64')
url="https://coverage.readthedocs.io/en/latest/"
license=('Apache-2.0')
depends=('glibc' 'python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-pytest' 'python-pytest-xdist' 'python-flaky' 'python-hypothesis')
source=("git+https://github.com/nedbat/coveragepy.git#tag=$pkgver")
sha512sums=('e2778d6cdf7d7ac5171c9fe020b13ba2c0bbc7afd56254363545ada5b012e051aee949b96c83a6e02ef137d2225a1e48c6757ecba17ee16e42f6ac4013061f54')
b2sums=('6870107dd292c5e70171ca9c71ef2000e184567ff3d3d66311cc0bbdae5c1a930da274ff115e654af77495016440321a62935890e52d7b61d66c9c53596fd92d')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python setup.py --quiet build_ext --inplace
  test-env/bin/python igor.py zip_mods
  PATH="$PWD/test-env/bin:$PATH" test-env/bin/python igor.py test_with_core ctrace tests/
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
