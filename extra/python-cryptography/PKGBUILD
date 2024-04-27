# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cryptography
pkgver=42.0.5
_commit=33833f031d9d36234e11d9671be150d53b9e598d
pkgrel=2
pkgdesc="A package designed to expose cryptographic recipes and primitives to Python developers"
arch=('x86_64')
license=('Apache')
url="https://pypi.python.org/pypi/cryptography"
depends=('python-cffi')
makedepends=('git' 'python-setuptools-rust' 'llvm' 'clang' 'lld' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-subtests' 'python-iso8601' 'python-pretend'
              'python-hypothesis' 'python-pytz' 'python-certifi')
source=("git+https://github.com/pyca/cryptography.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd cryptography
  # Drop all benchmark tests, this means we don't have to checkdepends on pytest-benchmark nor are
  # benchmark tests interesting for a distribution.
  rm -rf tests/bench
}

build() {
  cd cryptography
  echo $RUSTFLAGS
  # https://github.com/pyca/cryptography/issues/9023
  CC=clang RUSTFLAGS+="-Clinker-plugin-lto -Clinker=clang -Clink-arg=-fuse-ld=lld" python -m build --wheel --no-isolation
}

check() {
  cd cryptography
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version:$PWD/vectors" pytest -o addopts=''
}

package() {
  cd cryptography
  python -m installer --destdir="$pkgdir" dist/*.whl
}
