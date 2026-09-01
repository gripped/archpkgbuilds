# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.14.3
pkgrel=1
pkgdesc="A tool for measuring code coverage of Python programs"
arch=('x86_64')
url="https://coverage.readthedocs.io/en/latest/"
license=('Apache-2.0')
depends=('glibc' 'python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-pytest' 'python-pytest-xdist' 'python-flaky' 'python-hypothesis')
source=("git+https://github.com/nedbat/coveragepy.git#tag=$pkgver")
sha512sums=('cc1a14699ec19a14a95ccf40e46c3a9ad789d9111912097abe55cf39e03837d6435c72ecbbf3b680ea11a193e5c38440f226e52490b1d7d57fbba1b7fd2f2af8')
b2sums=('e470adabf0a11e8b13807c0cff51ff5e422c7aea032912069d1edf3dc5dd7a90a55237bc5c6209bcf6fca58ff06948a71f1ff21c1f989518d987dd67314d385f')

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
