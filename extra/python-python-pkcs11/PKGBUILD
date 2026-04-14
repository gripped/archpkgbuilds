# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=python-python-pkcs11
pkgver=0.9.4
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
sha512sums=('cd5b98c0aee621f1cd00720ea2057e78e9814c9cbc88828de1a73c76c4161a7cda0fd5d85e16df12d7be40a636c93614ef262c98d84225bdc74fc9940f382b09')
b2sums=('42820d33a1c05b7ca9d9a08b8ad2010eab057dc1e3fb63c4b61d0d9677ae18a3ef89fe426ac223d1241f4f02a5b6545ea1f4e4959a3d6bc9d3451303abbeefb8')

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
