# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Johannes Dewender   arch at JonnyJD dot net

pkgname=python-discid
pkgver=1.4.0
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
sha512sums=('1ab0110dd8bf4f33d13354822791538417b42862577084a22050d862ec4320e2212d286be63e7168972e89d4a72842387da46a65a063d52acd231b29ce14937b')
b2sums=('4964d461cbd3e6067761b41c356c75bb475a3f3aecc14965f68e2b5b160573b9ba04277c74173bdca929699709a184b098dcb168b25651d1f708d48919cd4039')

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
