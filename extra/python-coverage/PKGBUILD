# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.15.0
pkgrel=1
pkgdesc="A tool for measuring code coverage of Python programs"
arch=('x86_64')
url="https://coverage.readthedocs.io/en/latest/"
license=('Apache-2.0')
depends=('glibc' 'python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-pytest' 'python-pytest-xdist' 'python-flaky' 'python-hypothesis')
source=("git+https://github.com/nedbat/coveragepy.git#tag=$pkgver")
sha512sums=('9bc65aa4c29cb3c39466b416e93a1e53425b3f4e75caeb8dbfd5dc8c263383d33a6ad6114a03be362f881436d8ce3e9ed7a0c983d97f2d03e1703ce4b49cd09b')
b2sums=('0d51a6d044b21f1f9f22385d03cd9e4ca98a4a7acfde74ab039d96cc7ffab762ed9a01f5210541d33d321aa0e26f6b131547d44fa76758a4fe8a273f3cbc19de')

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
