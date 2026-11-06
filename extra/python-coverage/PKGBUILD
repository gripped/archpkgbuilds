# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.17.2
pkgrel=1
pkgdesc="A tool for measuring code coverage of Python programs"
arch=('x86_64')
url="https://coverage.readthedocs.io/en/latest/"
license=('Apache-2.0')
depends=('glibc' 'python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-pytest' 'python-pytest-xdist' 'python-flaky' 'python-hypothesis')
source=("git+https://github.com/nedbat/coveragepy.git#tag=$pkgver")
sha512sums=('17ba0e7568e1003605ce8ea53d8a234579cba34cd564476fd35a9569cb3a2f8966f91f9137ebcd42d5e894ddee7b148d1ccc874422c61cfd148147f07c0e214d')
b2sums=('5e638d1493dd22af65daf2c0a69f8d68eb8691586bb056a0135dc6f4c106d9eb0faea171d4cfa3291a08cb88856fc62492632a0cc99c950812a9c477d742dc26')

prepare() {
  cd $_pkgname
  # Pytest 9.2 requires an integer for assertion verbosity in native TOML config.
  sed -i 's/^verbosity_assertions = "5"$/verbosity_assertions = 5/' pyproject.toml
}

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
