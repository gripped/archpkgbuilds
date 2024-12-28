# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pynitrokey
pkgname=python-pynitrokey
pkgver=0.6.0
pkgrel=2
pkgdesc="A command line interface for the Nitrokey FIDO2 and Nitrokey Start"
arch=(any)
url="https://github.com/Nitrokey/pynitrokey"
license=('Apache-2.0 OR MIT')
depends=(
  libnitrokey  # NOTE: libnitrokey is required for udev rules
  python
  python-asn1crypto
  python-certifi
  python-cffi
  python-click
  python-click-aliases
  python-cryptography
  python-dateutil
  python-ecdsa
  python-fido2
  python-intelhex
  python-nethsm
  python-nitrokey
  python-nkdfu
  python-pyscard
  python-pyserial  # implicit via python-nitrokey
  python-pyusb
  python-requests
  python-semver  # implicit via python-nitrokey
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
# NOTE: there are no tests to run
optdepends=(
  'python-libusb1: for pro and storage subcommands'
)
source=(
  "$_name::git+$url.git?signed#tag=v$pkgver"
)
sha512sums=('759f41ac8b7599b4e623713da4f99fc0d821dae1d641c1159802cc5523467845660c17bbbb0dc8551fff4d4b64a785674fab357186fe527c6e3da17c883f2343')
b2sums=('d3e5a7c3642c7e84f2fb09b0c3300d02a29adca7cad6f2c339d9be8902596670bf27efe0559e96c6eaf45731c4537adf282b50c0743113ca8dfd80bda01a6ffb')
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
