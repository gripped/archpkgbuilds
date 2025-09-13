# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: PiC0 <guill.p.linux@gmail.com>

pkgname=python-xmltodict
pkgver=1.0.0
pkgrel=1
pkgdesc='Python module that makes working with XML feel like you are working with JSON'
arch=(any)
url='https://github.com/martinblech/xmltodict'
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-nose)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('e855b9c6d966aabc6ede2246828657d87d063a6cd11bf429f3a4864f8d299aa8e1b39d5b635848476c4e14997d0f03863ee0954c9581dac7d3cee94c59a4c901')
b2sums=('5cc5e81ebccf174bbdf8157447b997c58e416a779ec6e279d8efdb734a4949ef0a4c67c06a72a62b3757b54db18237f002dec5120c0d105512fc0e5af187b088')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  nosetests
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
