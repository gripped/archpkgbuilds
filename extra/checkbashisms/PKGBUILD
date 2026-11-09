# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=checkbashisms
pkgver=2.26.15
pkgrel=1
pkgdesc='Debian script that checks for bashisms'
arch=(any)
url='https://tracker.debian.org/pkg/devscripts'
license=(GPL-2.0-or-later)
depends=(perl)
makedepends=(git)
source=("$pkgname::git+https://salsa.debian.org/debian/devscripts#tag=v$pkgver")
sha512sums=('1cd0f79aeef521ae644d4ad33095aecbaa09ccb83a0c84ba9efcec176fed20835259f5f2ac48f1d2362954e5ce7ac21c9915aa84b99f7a39bdb5950f84432bfd')
b2sums=('326414ba4c21c9028f808bd2aeff084008a5a9ae9d44147b0e73e0528b5c21059ec21dec39979eba7b147811f20815965b15fd66ea9517a6a86750820c33347f')

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
