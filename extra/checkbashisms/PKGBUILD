# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=checkbashisms
pkgver=2.26.6
pkgrel=1
pkgdesc='Debian script that checks for bashisms'
arch=(any)
url='https://tracker.debian.org/pkg/devscripts'
license=(GPL-2.0-or-later)
depends=(perl)
makedepends=(git)
source=("$pkgname::git+https://salsa.debian.org/debian/devscripts#tag=debian/$pkgver")
sha512sums=('2da292801238bee566271cb737bc3d06cce18832d44edc1ba080b5ed9aafcc9246e6b45e24c0723bba8c0b86e6c32685ef18a288d20207577a6796d56326084d')
b2sums=('146a0994c44a968e49fa0179b77a1f137e5b4fea2bee5f99c2b311940f4a217fc236e58851ddbcf1e94949402e7bde990103cc80f66ab3842379b70875885d2c')

prepare() {
  cd "$pkgname/scripts"

  sed "s/###VERSION###/$pkgver/g" checkbashisms.pl > checkbashisms
}

package() {
  cd "$pkgname/scripts"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "$pkgname"

  # man page
  install -vDm644 -t "$pkgdir/usr/share/man/man1" "$pkgname.1"

  # bash completions
  install -vDm644 "$pkgname.bash_completion" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
