# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-benchmark
pkgver=5.2.3
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
sha512sums=('dd8ef74167629ba60ce3e9afa3b392c6fa3b4c65f99aab9a7ebed883789e0b426495e0e51d908ea31b6c58ce1bfec8fb5f9f34041888950ca280a5e464da55f8')

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
  cd pytest-benchmark
  python -m venv tmpenv --system-site-packages
  tmpenv/bin/python -m installer dist/*.whl
  PATH="$PWD/tmpenv/bin:$PATH" tmpenv/bin/python -m pytest tests
}

package() {
  cd pytest-benchmark
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
