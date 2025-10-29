# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=python-python-pkcs11
pkgver=0.9.1
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
sha512sums=('acc6f1c755e51ac29dbbb8568541c7cf378d65208fece90620ec6ce13c81b8358fdf6591480febb4dfda3a48094cbedc736a660f4c75d5272b7f490a2e4c7645')
b2sums=('9f6d00579892b7406935976829cf342673ec4362348eea3edd63c4cab82737643ae2d88631cf38ff0f3e7c0360319bedd731fc89839595f174dbfb36ae315e23')

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
