# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Roheim <david dot roheim at gmail dot com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>
# Contributor: Jonny Gerold <jonny@fsk141.com>

pkgname=s3fs-fuse
pkgver=1.95
pkgrel=1
pkgdesc="FUSE-based file system backed by Amazon S3"
arch=('x86_64')
url="https://github.com/s3fs-fuse/s3fs-fuse/wiki"
license=('GPL-2.0-or-later')
depends=('fuse2' 'curl' 'libxml2')
conflicts=('s3fs')
provides=('s3fs')
replaces=('s3fs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/s3fs-fuse/s3fs-fuse/archive/v$pkgver.tar.gz")
sha512sums=('73fd33895ace0e60fe8df392d474624f913a310c8df136bcc60b7d644ce7a92681ac7ced9bf9fcb9ef248f48b3bee3d4e871c172368c0b07626cb8f2ed3ba1b9')

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
