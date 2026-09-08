# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=python-python-pkcs11
pkgver=0.10.0
pkgrel=1
pkgdesc='PKCS#11/Cryptoki support for Python'
arch=(x86_64)
url='https://github.com/pyauth/python-pkcs11'
license=(MIT)
depends=(
  glibc
  python
  python-asn1crypto
)
makedepends=(
  git
  cython
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-cryptography
  python-oscrypto
  python-parameterized
  python-pytest
  softhsm
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('15a0fa58baf21cc75ae161c77b83b58f669d0a3c5f3ed786d6e9d5ea0dea6a8a2a2a25bde3f787fdabb38feb632c6c2efea18030f312b90bbd9d35501562e6a0')
b2sums=('0322bf35849dfba53f393759e229ebd4f435796da3217eba1f38ceabdb1458027e9709aeffc65de1372c19705dbb2b4682100f8db67d189c67cf907ff813b07d')

prepare() {
  cd "$pkgname"

  sed -n '/^Copyright/,$p' README.rst > LICENSE
}

build() {
  cd "$pkgname"

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  export PKCS11_MODULE=/usr/lib/libsofthsm2.so
  export PKCS11_TOKEN_LABEL=TEST
  export PKCS11_TOKEN_PIN=1234
  export PKCS11_TOKEN_SO_PIN=5678

  softhsm2-util \
    --init-token \
    --free \
    --label "${PKCS11_TOKEN_LABEL}" \
    --pin "${PKCS11_TOKEN_PIN}" \
    --so-pin "${PKCS11_TOKEN_SO_PIN}"

  local _python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  export PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_python_version"

  pytest --import-mode=append -k 'not test_aes_gcm_test_vector and not test_encrypt_gcm'
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
