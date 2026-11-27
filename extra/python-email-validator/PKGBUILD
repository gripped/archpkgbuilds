# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-email-validator
pkgver=2.4.0
pkgrel=1
pkgdesc="A robust email address syntax and deliverability validation library"
arch=(any)
url="https://github.com/JoshData/python-email-validator"
license=(Unlicense)
depends=(
  python
  python-dnspython
  python-idna
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('24dd68e0f4342ffa216244a0670f3f517c138f7c808f85e70e1ca60300d69987c3911a8988241846aaa1b824986ec14362fe389a50dc86a6e01b70975941ccfe')
b2sums=('ce3514392f870983b6cf8ccd4086e3b6e80688054ff600e2c775eb1b0f34230b27946a6b251a4cce7506b0a37e76b311ee978ae6ca8d8ec4f7dcb3d779447814')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m pytest
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
