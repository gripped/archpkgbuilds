# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-benchmark
pkgver=5.3.1
pkgrel=1
pkgdesc='A py.test fixture for benchmarking code'
arch=('any')
license=('BSD-2-Clause')
url='https://github.com/ionelmc/pytest-benchmark'
depends=('python-pytest' 'python-py-cpuinfo2')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pygal' 'python-pygaljs' 'python-freezegun' 'mercurial' 'python-aspectlib'
              'python-pytest-xdist' 'python-elasticsearch' 'git')
source=("git+https://github.com/ionelmc/pytest-benchmark.git#tag=v$pkgver")
sha512sums=('2bc39404f8aa1b74edf085aa53b308a41cca53949238c57d15433ed42224b1e32714200ff2db85bcad6a8f4472fe6233a8fe74188eec6f4f90cf4a4af2d68743')

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
