# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pynitrokey
pkgname=python-pynitrokey
pkgver=0.14.0
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
  python-cryptography
  python-fido2
  python-intelhex
  python-libusb1
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
  'python-pyscard: for PC/SC support'
)
source=(
  "$_name::git+$url.git?signed#tag=v$pkgver"
)
sha512sums=('3e06fcb501bd3876690cf69f02d9d25f71bf92f8cae9ef1bcc080da477e0fff68508949812f17610cce7551abb0b587125b8feb103d96a9ce1bc48b39d33af32')
b2sums=('45efa257943a76a981928786a7fdc7234ed2d1660a227801bcf7bd2af8775a42ace4ea24a9e6c35f240443b712096b0f15831e53736d676a4be81c80627b9c6d')
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
