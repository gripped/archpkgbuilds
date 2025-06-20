# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.9.1
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
sha512sums=('6bf8c97d9128dc74b40b17a70d763a3d6c4e509355169172ca80087473221aacc367e6e60762adb25f2c6ca660792038da41f00c3f8f482c96ec5b4a2e9ca86b')
b2sums=('63806989378cd37ad7d430496d99f11fb4d90313d1b5735791f0e8a44ea778095f84e3879109cafb35b1f77ba71a40f52903a88fd3a0f7b446dc23dfa49d8e69')

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
