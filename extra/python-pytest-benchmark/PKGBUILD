# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-benchmark
pkgver=5.2.2
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
sha512sums=('a4eb6acb2d9c0b354ecb59a4b2c386b1c0169c43d2a52fa6cb34f1de42f327f3b3eafaa692e3003f58a1e8e4a89948a6f9f23899b9d3ea140ba1d4faa6fde52f')

prepare() {
  cd pytest-benchmark
  # Fix pytest 9 compatibility in the CLI.
  git cherry-pick -n -X ours d5c2f7ef9d0bbd67d8bafac1e2a454c8aa95af10
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
