# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pynitrokey
pkgname=python-pynitrokey
pkgver=0.8.1
pkgrel=1
pkgdesc="A command line interface for the Nitrokey FIDO2 and Nitrokey Start"
arch=(any)
url="https://github.com/Nitrokey/pynitrokey"
license=('Apache-2.0 OR MIT')
depends=(
  nitrokey-udev-rules
  python
  python-cffi
  python-click
  python-click-aliases
  python-cryptography
  python-ecdsa
  python-fido2
  python-intelhex
  python-nethsm
  python-nitrokey
  python-nkdfu
  python-pyserial  # implicit via python-nitrokey
  python-pyusb
  python-requests
  python-semver
  python-tlv8
  python-tqdm
)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
  python-wheel
)
# NOTE: there are no tests to run
optdepends=(
  'python-libusb1: for pro and storage subcommands'
  'python-pyscard: for PC/SC support'
)
source=(
  "$_name::git+$url.git?signed#tag=v$pkgver"
)
sha512sums=('102534cb1feaefa47dc4424d6da611577736637a55788fed104c76a5746a218b6da561084a04e6c570f59df155f4873e3f6e7ddfddf819faf341e3914982f7b7')
b2sums=('86d3c0b4dc2b263b7b13eba07e33c28606e7501c77c905627efb457e50e98153427ae832c9cbe51488c4ae20cb6c4bea25ad7fdcbcf1d0d45acd82c9e6c0a36f')
validpgpkeys=(
  868184069239FF65DE0BCD7DD9BAE35991DE5B22  # Szczepan Zalega <szczepan@nitrokey.com> (@szszszsz)
  CC74B7120BFAA36FF42868724C1449F1C9804176  # Markus Meissner <meissner@nitrokey.com> (@daringer)
  719EA31C3F1814DA787C8FD434F47D2F044B8F17  # Robin Krahl <robin@nitrokey.com> (@robin-nitrokey)
  93CCB0DB717DAE30622F671436DA48A4C827B354  # Sosthène Guédon <sosthene@nitrokey.com> (@sosthene-nitrokey)
)

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
