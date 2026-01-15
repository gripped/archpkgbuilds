# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-icecream
pkgver=2.1.9
pkgrel=1
pkgdesc='Sweet and creamy print debugging'
arch=(any)
url='https://github.com/gruns/icecream'
license=(MIT)
depends=(
  python
  python-colorama
  python-pygments
  python-executing
  python-asttokens
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('a1c3edd36e1ad9a13edeac7f71de9a11d231fc485d54f1eb595c0f057dabf1750cd57a818b5cce3a53d51a6b6e565be4550188548e750d6b51c89c57155ab4b5')
b2sums=('abd315015d5fb8af75ba052ddf3c131edcb475be2636374842c79aefc891520cd5aca5e826ba4998311b2aae6a701ecd7c2e0d0ab4720ea66f74bf6861069d37')

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

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
