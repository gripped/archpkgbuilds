# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: PiC0 <guill.p.linux@gmail.com>

pkgname=python-xmltodict
pkgver=0.15.1
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
sha512sums=('55c281f4a12cd30653c2a8d8e2295f2eada36156089225cd036dd7dbd6be80a53d622fe33c2bb2c1bb91e45432a60bf22ce0354e690e50f852114ac155e60cf1')
b2sums=('3d07dec5d0e1980bc4075ef19906f6a335c58a1b6ea500d7bc4b1882602aaf986da5e4a3800b641f30b743848049732b770368793502c5073c62ed2c11eaeca6')

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
