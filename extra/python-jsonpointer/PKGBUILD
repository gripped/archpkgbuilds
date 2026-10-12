# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python-jsonpointer
pkgver=3.2.1
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
sha512sums=('9eb992b2e7b091caf09408e12b10393f6aca84fceacf6143aea55f5465fabbb3f17c3b0922e6ddaddd7d8472b8909afc2687f987bfd60ab8d423803fc6b2e0bb')
b2sums=('0381e8d56b8e3d020f28fbc9eed0121bf81b5b78b4510715a6f543fb1da2d43c03690dca6830f0d5c35b5eae4e364213f1759b0704d71477a99d8463063a0a3b')

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
