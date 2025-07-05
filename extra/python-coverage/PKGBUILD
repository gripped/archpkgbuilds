# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.9.2
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
sha512sums=('b378559d5e293a735d5de6f0ae3a0896100d47a724baf05e028f4236e3360b783609ab1bbf0b8f7dba6e273f6fd04437a96facc8cb25b89fddb64393861e139e')
b2sums=('ee18a116e12cd54e85f873a47c74e6c18746e8ffe0226b80fd1d54ef4e64ca5acbe2c04a7a5d9d187e1414de291e1b8247a337c4b25ea733792eff9b59a7326a')

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
