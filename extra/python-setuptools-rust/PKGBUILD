# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: codedust
# Contributor: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Clayton Craft <clayton at craftyguy dot net>

pkgname=python-setuptools-rust
pkgver=1.11.0
pkgrel=1
pkgdesc="Compile and distribute Python extensions written in rust as easily as if they were written in C."
arch=('any')
license=('MIT')
url="https://github.com/PyO3/setuptools-rust"
depends=('rust' 'python-setuptools' 'python-semantic-version')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-pytest-benchmark' 'python-beautifulsoup4' 'python-lxml' 'python-cffi')
source=("git+https://github.com/PyO3/setuptools-rust.git#tag=v$pkgver")
sha512sums=('045fc3c4cc523d71494deaa545d5caf341b9b8c2bb4da7cceff6aa97ceb5f642717768d4e46d734d44859248278fc718e6c19e6fd2f8b10390df0e524241b827')

build() {
  cd setuptools-rust
  python -m build -nw
}

check() {
  cd setuptools-rust
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  for _dir in examples/*; do
    pushd $_dir
    PYTHONPATH="$PWD/../.." python -m build -nw
    python -m installer -d tmp_install dist/*.whl
    [[ -d tests || -d test ]] && PYTHONPATH="$PWD/tmp_install/usr/lib/python$python_version/site-packages" pytest tests
    popd
  done
  pytest --doctest-modules setuptools_rust
}

package() {
  cd setuptools-rust
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
