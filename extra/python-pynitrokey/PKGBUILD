# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pynitrokey
pkgname=python-pynitrokey
pkgver=0.13.0
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
sha512sums=('916b925428360f2a24836dddcb81b3670c1b61815f01b8e9545c527386f03631f49bc63eb3fda9464c428a7673c7f2c3e5ef422c14b5fd15e3ebf1b7993ec495')
b2sums=('d2c54465130da6d4fbedfe761e32165f22b1ca47fa8464b7f952542905b49c419f2141d4787082a4e2e54676bb12360f3391f0cc62ab67553297e29e797a0564')
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
