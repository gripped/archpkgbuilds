# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-icecream
pkgver=2.1.6
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
sha512sums=('359a0bf581e13c4ca4b847097fb1a84e23cafc10c0ba54539f1806d500400e15554b905e138482e853a35c2c099cd9596eec8012c19402b56ab9b991ad38a8f1')
b2sums=('a91e4370c7145ec7260b7a91ad21fe0b76fd244db83f18b89061a380f037c41a6400f3a53438f5f7e842745190fc4b9283a83cf83b768661628e1c3c2f16fa65')

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
