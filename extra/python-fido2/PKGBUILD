# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Emil Lundberg <emil@emlun.se> <emil@yubico.com>

pkgname=python-fido2
pkgver=2.0.0
pkgrel=2
pkgdesc='Library for FIDO 2.0, including communication with a device over USBA'
url='https://github.com/Yubico/python-fido2'
license=('custom:BSD-2-clause')
arch=('any')
depends=(
    'python'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-poetry-core'
)
checkdepends=(
    'python-cryptography'
    'python-pytest'
)
validpgpkeys=('20EE325B86A81BCBD3E56798F04367096FBA95E8') # Dain Nilsson <dain@yubico.com>
source=("git+https://github.com/Yubico/${pkgname}.git#tag=${pkgver}?signed")
sha256sums=('03a544ab5539355394ae4de237fc1890f1875e8319a3fec54249c254928fd41c')

build() {
  cd "${srcdir}/${pkgname}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}"

  python -m unittest discover -vs .
}

package() {
  cd "${srcdir}/${pkgname}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m0644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
