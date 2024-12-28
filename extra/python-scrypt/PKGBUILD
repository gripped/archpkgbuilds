# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=python-scrypt
pkgver=0.8.27
pkgrel=2
pkgdesc='Bindings for the scrypt key derivation function library'
url='https://github.com/holgern/py-scrypt'
arch=('x86_64')
license=('BSD-2-Clause')
depends=('python' 'glibc' 'openssl')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('028fdad9d6915c8d1e45057f5e0e3f717d115afdddf52b10af9df09ef37ef09bb49be2cef9d4f0d60a4cfce8ab51a9c1e6c1ee4b106bbe8b35bfa26f7676ce73')
b2sums=('efb18714febaeae71e0b40569d81011a70a90e7ebe0e9b7dc07e51e87e0d912d6252a377ea32c73edb2f594e7dca4dea876683dd5e2f365ea1ad96a86bbeb8bb')

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
