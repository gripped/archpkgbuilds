# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=python-python-pkcs11
pkgver=0.9.5
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
sha512sums=('f8df1ab7805f7cf3eb117a0402cc0b849273ebd8aad6808cc5ad8e7c4b67194410541cd50d5292c01729766c9ab0d9ee0d75fb016f04c01c82eba77e6922734d')
b2sums=('358b06c614008446e422f1ce05ba1d672980ed7235a8a9996d1ffb412d47991d522a7250ddbc547e386971999040197b1c440f455a074035c7de97091b5900b3')

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
