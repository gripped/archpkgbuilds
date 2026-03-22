# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python-jsonpointer
pkgver=3.1.0
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
sha512sums=('99cb9d07c59fa6007543e86fec130375db03af298a66fc39f853eab677167b537cfa96c636e43254bebc23a3be0bbe7e50dce5d31ee3ea57db278b4d788d3241')
b2sums=('4b3a8635539f5efec10ac9e2602770eb8f84ce653964821c4dcd8b8d61ac62ef7dc3ab04b5ff8c10a4d8c568f7b4c5c7550c310d1dc54506ddacb5fc396fb828')

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
