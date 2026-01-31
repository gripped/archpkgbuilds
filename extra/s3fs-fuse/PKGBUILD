# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Roheim <david dot roheim at gmail dot com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>
# Contributor: Jonny Gerold <jonny@fsk141.com>

pkgname=s3fs-fuse
pkgver=1.96
pkgrel=1
pkgdesc="FUSE-based file system backed by Amazon S3"
arch=('x86_64')
url="https://github.com/s3fs-fuse/s3fs-fuse/wiki"
license=('GPL-2.0-or-later')
depends=('fuse3' 'curl' 'libxml2')
conflicts=('s3fs')
provides=('s3fs')
replaces=('s3fs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/s3fs-fuse/s3fs-fuse/archive/v$pkgver.tar.gz")
sha512sums=('1ad5a99e6bb86e04e95d4de6a56d460766b6f8aaec22b1d06685eee4344decfd0b14ecf37bbc6e8511a1863a21586465401c72112eca2589a80c16c0f4bb0f1d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
