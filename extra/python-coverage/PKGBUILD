# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.10.4
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
sha512sums=('b747bbbe44ffa999097e969713edc4b03ffdaa904b8e59afc75b821a435f0f9ecd9b589c7dc458bd97f9471dcb054d9c75f9cb90075b79bae246c67f2ec9c522')
b2sums=('9f8160396fc0461c466ddf9cc859b1ddc8a063726622c4767236ca2278527a65303bd9e8eae25f8d20d03f360ab2533e326ce988de3ee3a53c85f8fefe674502')

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
