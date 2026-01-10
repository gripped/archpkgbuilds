# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Johannes Dewender   arch at JonnyJD dot net

pkgname=python-discid
pkgver=1.3.0
pkgrel=2
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
sha512sums=('1556d3cb40a6397583702a41cc41e9506cee848edc4b05c0ced32dd9197464c0c68b2f6cd1770245a9737449a313f9985cbce30956d98f21691ce48b32929770')
b2sums=('ca51b5c40babc4f13ac849e2570a104de55cfc30fbf83ebcc2693dae182ae61285d4579aa7a8417f0cabe8beba7dfa78c5bd4e3da2fdda7fae6152a5715a5350')

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
