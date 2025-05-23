# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pynitrokey
pkgname=python-pynitrokey
pkgver=0.8.3
pkgrel=1
pkgdesc="A command line interface for the Nitrokey FIDO2 and Nitrokey Start"
arch=(any)
url="https://github.com/Nitrokey/pynitrokey"
license=(
  'Apache-2.0 OR MIT'
  LGPL-3.0-only
  GPL-3.0-or-later
)
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
sha512sums=('f745fbf331385d74bb134ae287b1f5f687fb1a743206dada785fbe72fc434310844b9f3ee2eb4ff0826cf6b182a368976692636b2180f3f53b7d816b0f59db7d')
b2sums=('40e778a2ee9ae5d0bb0f686c4b463c4de908536dd5ccdc5232aeb44a7d26acd3253b99d05c4206bb9ad2caf2bb608e5dfd106d8a385ee8b5a21233b8a3911870')
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
  install -vDm 644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
