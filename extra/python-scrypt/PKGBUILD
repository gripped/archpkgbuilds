# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=python-scrypt
pkgver=0.8.29
pkgrel=1
pkgdesc='Bindings for the scrypt key derivation function library'
url='https://github.com/holgern/py-scrypt'
arch=('x86_64')
license=('BSD-2-Clause')
depends=('python' 'glibc' 'openssl')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a985e31289011d56486d89b2b16a93a4e26d9be2316e9f84909b695b8f497664eee678aaaf830ad0912eb0372549fdacee30e707e77a80db4321d5632359806b')
b2sums=('d662acf6181656fae6489674576099d167581ed2697988d1cf444cdc4225f5c906b8c590c0db0b62811e3d7867edbccdadbfb9bf9aa344860f922dd2ce4ecbd0')

build() {
  cd py-scrypt-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd py-scrypt-${pkgver}
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" python -m unittest discover -vs .
}

package() {
  cd py-scrypt-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -r "${pkgdir}"/usr/lib/python*/site-packages/scrypt/tests
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
