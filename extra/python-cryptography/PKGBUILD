# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cryptography
pkgver=42.0.7
pkgrel=1
pkgdesc="A package designed to expose cryptographic recipes and primitives to Python developers"
arch=('x86_64')
license=('Apache')
url="https://github.com/pyca/cryptography"
depends=('python-cffi')
makedepends=('git' 'python-setuptools-rust' 'llvm' 'clang' 'lld' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-subtests' 'python-iso8601' 'python-pretend'
              'python-hypothesis' 'python-pytz' 'python-certifi')
source=("git+https://github.com/pyca/cryptography.git#tag=$pkgver")
sha512sums=('67799ba316a9ed09cc92ef2497d17d74d323514a0114a9c0eaf443766f8d176aab5ca3a349fe54b0b46c89ff8e2407499e5e1418925e0b95e5218163620c5875')

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
