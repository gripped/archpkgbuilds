# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-cryptography
pkgver=45.0.5
pkgrel=1
pkgdesc="A package designed to expose cryptographic recipes and primitives to Python developers"
arch=('x86_64')
license=('Apache-2.0 OR BSD-3-Clause')
url="https://github.com/pyca/cryptography"
depends=(
  'gcc-libs'
  'glibc'
  'openssl'
  'python'
  'python-cffi'
)
makedepends=(
  'clang'
  'git'
  'lld'
  'llvm'
  'python-build'
  'python-installer'
  'python-maturin'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-certifi'
  'python-hypothesis'
  'python-pretend'
  'python-pytest'
)
source=("git+https://github.com/pyca/cryptography.git#tag=$pkgver")
sha512sums=('7977f155534e42e05d85b934293271997d320355f5231b71933b9d4b967f33f4930edbaedee24dc23188f37ea0122b91dea241470703f9c4a3721d031029ff95')

prepare() {
  cd cryptography
  # Drop all benchmark tests, this means we don't have to checkdepends on
  # pytest-benchmark nor are benchmark tests interesting for a distribution.
  rm -rf tests/bench
}

build() {
  cd cryptography
  echo "$RUSTFLAGS"
  # https://github.com/pyca/cryptography/issues/9023
  CC=clang RUSTFLAGS+=" -Clinker-plugin-lto -Clinker=clang -Clink-arg=-fuse-ld=lld" \
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd cryptography
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir="tmp_install" dist/*.whl
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PWD/vectors" \
    pytest --override-ini="addopts="
}

package() {
  cd cryptography
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.BSD
}
