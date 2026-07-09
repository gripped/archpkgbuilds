# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pynitrokey
pkgname=python-pynitrokey
pkgver=0.12.3
pkgrel=1
pkgdesc="A command line interface for the Nitrokey FIDO2, Nitrokey Start, Nitrokey 3 and NetHSM"
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
  python-poetry-core
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
sha512sums=('add74eb148bdaae3921a27c9c605d61c5fbe838c5f4b4c87969f93dd11e9030c41943c6c59d12512f00b0395215c3c5dbd74a5bc493b8f493857dcde53098fbe')
b2sums=('c3a11cbe2f0e66f98532fe39542f3ae9e1d7204a7fd08c4c75f7e7833afbfe6f1a1939acf84db85f10bf329303ce55f7991806bf3de46c976444df17c94498ec')
validpgpkeys=(
  868184069239FF65DE0BCD7DD9BAE35991DE5B22  # Szczepan Zalega <szczepan@nitrokey.com> (@szszszsz)
  CC74B7120BFAA36FF42868724C1449F1C9804176  # Markus Meissner <meissner@nitrokey.com> (@daringer)
  97591008D82D0751EF438D35804551D1A83A3C83  # Markus Merklinger <markus@nitrokey.com> (@mmerklinger)
  463D8C09EC635FC7DA5681439C44D117B05429AC  # Robin Krahl <robin@nitrokey.com> (@robin-nitrokey)
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
