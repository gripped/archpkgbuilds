# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Johannes Dewender   arch at JonnyJD dot net

pkgname=python-discid
pkgver=1.4.1
pkgrel=1
pkgdesc="Python binding of MusicBrainz libdiscid"
url="https://github.com/JonnyJD/python-discid"
license=(LGPL-3.0-or-later)
arch=(any)
depends=(
  libdiscid
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('363f7c1b4a07bd895e0d9631b258796a5d87207be7bba5f37ff12e63858cc33533b0dfe90214b5b5802ce549af4eb658828b6bd9b6eb990a177cfcf1b5624fc5')
b2sums=('c4d36b5f60149abd8238a1abccf843c00ef00fe8a7d539c1df01d112d496782fde950f21de4d6ffe05f1ef57fbff5cfd067032551173398a47ae61be5765b210')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest -vv
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
