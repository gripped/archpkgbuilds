# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.15.3
pkgrel=1
pkgdesc="A tool for measuring code coverage of Python programs"
arch=('x86_64')
url="https://coverage.readthedocs.io/en/latest/"
license=('Apache-2.0')
depends=('glibc' 'python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-pytest' 'python-pytest-xdist' 'python-flaky' 'python-hypothesis')
source=("git+https://github.com/nedbat/coveragepy.git#tag=$pkgver")
sha512sums=('bdbf4cdbe7e1f3e6935e540ed5f888354faff15e2279cb5f6c77e71ca67ecc7c1afedc61ebb484e127903b25bba8bfaf544fe78fd54e1bee0b5e7b0017ac4a14')
b2sums=('30cb081d77e02dd85efb0bbdfce6a24cbd11e6965e7a9d0134a52b1ecbc94baaa286304bc9dced73a1c119e641c6aa8f45c59e334e21592e03e42da8051404e4')

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
