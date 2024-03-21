# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pynitrokey
pkgname=python-pynitrokey
pkgver=0.4.46
pkgrel=1
pkgdesc="A command line interface for the Nitrokey FIDO2 and Nitrokey Start"
arch=(any)
url="https://github.com/Nitrokey/pynitrokey"
license=('Apache-2.0 OR MIT')
depends=(
  libnitrokey  # NOTE: libnitrokey is required for udev rules
  python
  python-certifi
  python-cffi
  python-click
  python-click-aliases
  python-cryptography
  python-dateutil
  python-ecdsa
  python-fido2
  python-frozendict
  python-intelhex
  python-nethsm
  python-nkdfu
  python-protobuf
  python-pyserial
  python-pyusb
  python-requests
  python-semver
  python-spsdk
  python-tlv8
  python-tqdm
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
  python-wheel
)
checkdepends=(python-pytest)
optdepends=(
  'python-libusb1: for pro and storage subcommands'
  'python-pyscard: for pcsclite integration'
)
source=("git+$url.git?signed#tag=v$pkgver")
sha256sums=('c74711e8cf20fc2eaa8dddc7c73f3a4dfe6fa7e97a8c798922f15ed48be20ef7')
validpgpkeys=(868184069239FF65DE0BCD7DD9BAE35991DE5B22  # Szczepan Zalega <szczepan@nitrokey.com> (@szszszsz)
              CC74B7120BFAA36FF42868724C1449F1C9804176  # Markus Meissner <meissner@nitrokey.com> (@daringer)
              719EA31C3F1814DA787C8FD434F47D2F044B8F17  # Robin Krahl <robin@nitrokey.com> (@robin-nitrokey)
              93CCB0DB717DAE30622F671436DA48A4C827B354) # Sosthène Guédon <sosthene@nitrokey.com> (@sosthene-nitrokey)

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

# tests seem all to be integration tests currently: https://github.com/Nitrokey/pynitrokey/issues/294
# check() {
#   cd $_name
#   pytest -vv
# }

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
