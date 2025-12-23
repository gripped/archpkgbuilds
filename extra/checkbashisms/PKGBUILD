# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=checkbashisms
pkgver=2.25.32
pkgrel=1
pkgdesc='Debian script that checks for bashisms'
arch=(any)
url='https://tracker.debian.org/pkg/devscripts'
license=(GPL-2.0-or-later)
depends=(perl)
makedepends=(git)
source=("$pkgname::git+https://salsa.debian.org/debian/devscripts#tag=v$pkgver")
sha512sums=('b58d4250e7a20451b80bc85489a8fd63d234a9f7b0fad50165de5327774109eb24b1ec7e6ba0924e8ff4cf86fb69442f72fb397e93d05fbdcdba5f5dc5681c71')
b2sums=('b1ff51a22bebe7c60acb1c86a8b9ada13ce819f3f410c574d5f8bd0fad92cc887637aa57f5bcba95b6a7df15e9a6bd48ff1991e9b1b76b90eabfa97d5599ec7d')

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
