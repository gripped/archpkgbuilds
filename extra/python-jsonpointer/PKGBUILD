# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python-jsonpointer
pkgver=3.8
pkgrel=1
pkgdesc='Identify specific nodes in a JSON document (RFC 6901)'
arch=(any)
url='https://python-json-pointer.readthedocs.org/'
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("$pkgname::git+https://github.com/stefankoegl/python-json-pointer#tag=v$pkgver")
sha512sums=('b05d6e8a1efe4fb1fd9846b63aa6abf948482470c2a6b2968713ba17232c9ffdfb80d9008f9f1b5f1121b42d6580a2649f90b8118f623eca78744af8ae57f85e')
b2sums=('f3055e69892c877a2d31aa260a20be114daa16cb4f43b85441249315b8d11e128cbfd38de4bfa33b640e97326aa5fbb751d95d80f86b55589551c8307201f182')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
