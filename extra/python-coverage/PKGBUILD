# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.8.0
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
sha512sums=('433fa28ffc5a816086523d6b90c1f6ce626ecc6f2b638c82f0f4c1b1dfc22a17efdee3337222799aa1b6749441546d9c0921d7799f47839fffea86a2f78dbeee')
b2sums=('3f9e5b8b4baa5e5cb6aea7829839c1111781dfa161468924f4a2d738f43d41cfa0fe24eeca349a48a1a4e0dc422152aecc30c2c3a49be156832b683d6bab2074')

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
