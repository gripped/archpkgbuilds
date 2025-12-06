# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=checkbashisms
pkgver=2.25.29
pkgrel=1
pkgdesc='Debian script that checks for bashisms'
arch=(any)
url='https://tracker.debian.org/pkg/devscripts'
license=(GPL-2.0-or-later)
depends=(perl)
makedepends=(git)
source=("$pkgname::git+https://salsa.debian.org/debian/devscripts#tag=v$pkgver")
sha512sums=('ca8a3bdb826f56e890b96486acb8fbe3a5cd9ef5b04074df60f8404b31c7a12d82cde15a3a553f1b7160cdf50d428a17a4f2d38203ba2de15ea289bb5963e610')
b2sums=('cdb207c0028c1dadb4cacc00b2e256cb60db1f219c3606f95a5f9e4e8b0083c4a79d5e2e1532efcb2a8c6c3f5e792e1ff8fb8e0310fcd4842dfed7409c15474e')

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
