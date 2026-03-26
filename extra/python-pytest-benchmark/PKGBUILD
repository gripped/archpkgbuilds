# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-benchmark
pkgver=5.1.0
pkgrel=1
pkgdesc='A py.test fixture for benchmarking code'
arch=('any')
license=('BSD-2-Clause')
url='https://github.com/ionelmc/pytest-benchmark'
depends=('python-pytest' 'python-py-cpuinfo')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pygal' 'python-pygaljs' 'python-freezegun' 'mercurial' 'python-aspectlib'
              'python-pytest-xdist' 'python-elasticsearch' 'python-sniffio' 'git')
source=("git+https://github.com/ionelmc/pytest-benchmark.git#tag=v$pkgver")
sha512sums=('b13924ef32a8bad504c879c28264be860b76f2be0d8a4b8291c80276628ac66a1ba4397fccb88e93cb23b6e0bbe76ade82cacb7e8228ee1f1a0285980877ef74')

prepare() {
  cd pytest-benchmark
  # Do not treat warnings as errors
  sed -i '/^    error$/d' pytest.ini
  # Remove --nbmake option (nbmake plugin not packaged in Arch)
  sed -i '/--nbmake/d' pytest.ini
}

build() {
  cd pytest-benchmark
  python -m build --wheel --no-isolation
}

check() {
  # Hack entry points by installing it

  cd pytest-benchmark
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" PATH="$PWD/tmp_install/usr/bin:$PATH" \
    python -m pytest tests --deselect tests/test_cli.py::test_help
}

package() {
  cd pytest-benchmark
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
