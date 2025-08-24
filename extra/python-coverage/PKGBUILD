# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.10.5
pkgrel=1
pkgdesc="A tool for measuring code coverage of Python programs"
arch=('x86_64')
url="https://coverage.readthedocs.io/en/latest/"
license=('Apache-2.0')
depends=('glibc' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-flaky' 'python-hypothesis'
              'python-pytest' 'python-pytest-xdist'
              'python-unittest-mixins' 'python-virtualenv')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nedbat/coveragepy/archive/$pkgver.tar.gz")
sha512sums=('717fa86ac61265b19703937321dbb867ab19fd2cb12fc8f007d00da7fc15f8ec3bf9337b2f99f85611364378c6cd89622af5c72842b9b41579d45b45d2899917')
b2sums=('43be17f5c3d082f5d2f452a0d224415edda0151abffc4f5a130f862c62d270b0393e171c1ebf30799823857d29a8f8a5a2a302980daf73caee0187ad00baad4e')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  local python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
  (
    virtualenv "test_dir" --system-site-packages
    . "test_dir/bin/activate"
    export PYTHONPATH="/usr/lib/python$python_version/site-packages:$PYTHONPATH"
    export COVERAGE_NO_CONTRACTS=1
    python setup.py --quiet clean develop
    python igor.py zip_mods install_egg remove_extension
    python igor.py test_with_tracer py
    python setup.py --quiet build_ext --inplace
    python igor.py test_with_tracer c
  ) || echo "Known failing tests."
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
}
