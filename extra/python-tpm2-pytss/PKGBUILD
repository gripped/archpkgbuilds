# Maintainer:
pkgname=python-tpm2-pytss
_name=${pkgname#python-}
# NOTE: no trust path: https://github.com/tpm2-software/tpm2-pytss/issues/566
pkgver=2.1.0
_commit=d4cccb9e1164281455a3c05f4aab2e663133726b  # refs/tags/2.1.0
pkgrel=3
pkgdesc='Python bindings for tpm2-tss'
arch=(x86_64)
url='https://github.com/tpm2-software/tpm2-pytss'
license=(BSD-2-Clause)
depends=(
  glibc
  python
  python-asn1crypto
  python-cffi
  python-cryptography
  python-packaging
  python-yaml
)
makedepends=(
  git
  python-build
  python-installer
  python-pkgconfig
  python-setuptools
  python-setuptools-scm
  python-wheel
  tpm2-tss
)
checkdepends=(
  python-pytest
  swtpm
  tpm2-tools
)
source=(
  "git+$url.git#tag=$_commit?signed"
  $pkgname-2.1.0-cryptography_renames.patch::https://github.com/tpm2-software/tpm2-pytss/commit/e4006e6066c015d9ed55befa9b98247fbdcafd7d.patch
)
sha512sums=('SKIP'
            '5168d36ccd4b0f7ba51ccc03111820650866d1aa3bc5fefaec601f94af979d887d77111eaa5869e27d918d77c6e414065e97d7656153a2873bb92c5405b8ac65')
validpgpkeys=('5B482B8E3E19DA7C978E1D016DE2E9078E1F50C1') # William Roberts (Bill Roberts) <william.c.roberts@intel.com>

pkgver() {
  cd $_name
  git describe | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  patch -Np1 -d $_name -i ../$pkgname-2.1.0-cryptography_renames.patch
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )

  cd $_name
  local _python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_python_version" pytest "${pytest_options[@]}"
}

package() {
  depends+=(
    tpm2-tss libtss2-esys.so libtss2-fapi.so libtss2-mu.so libtss2-rc.so libtss2-tctildr.so
  )

  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
