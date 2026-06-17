# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-clevercsv
pkgver=0.8.4
pkgrel=1
pkgdesc="A Python package for handling messy CSV files"
url="https://github.com/alan-turing-institute/CleverCSV"
license=('MIT')
arch=('x86_64')
depends=('python-chardet' 'python-regex' 'python-packaging')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-pandas' 'python-tabview' 'python-wilderness' 'python-faust-cchardet')
checkdepends=('python-pytest' 'python-pandas' 'python-tabview' 'python-wilderness'
              'python-faust-cchardet' 'python-termcolor')
source=("git+https://github.com/alan-turing-institute/CleverCSV.git#tag=v$pkgver")
sha512sums=('606e9300522f2b67fc6e487082303f038583e362c11913f23fbe3bf75cd9a4881bfc99ae9a81b427ec42da73d905f31b8ad17a70f81e406d522784d34e74e9e5')

prepare() {
  cd CleverCSV

  git cherry-pick -n c4999f9bb5db818a613c815514b058dfacb354bd
}

build() {
  cd CleverCSV
  python -m build --wheel --no-isolation
}

check() {
  cd CleverCSV
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  # chardet 6 can still return None for tiny Latin-1 samples after upstream's relaxed expectations.
  PYTHONPATH="build/lib.linux-x86_64-cpython-${python_version}" pytest \
    --deselect tests/test_unit/test_console.py::ConsoleTestCase::test_standardize_target_encoding2 \
    --deselect tests/test_unit/test_encoding.py::EncodingTestCase::test_encoding_chardet
}

package() {
  cd CleverCSV
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir "$pkgdir"/usr/share
  mv "$pkgdir"/usr/man "$pkgdir"/usr/share/man 

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
