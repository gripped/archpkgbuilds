# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=checkbashisms
pkgver=2.24.5
pkgrel=1
pkgdesc='Debian script that checks for bashisms'
arch=('any')
url='https://tracker.debian.org/pkg/devscripts'
license=('GPL-2.0-or-later')
depends=('perl')
source=("https://salsa.debian.org/debian/devscripts/-/archive/v$pkgver/devscripts-v$pkgver.tar.gz")
sha512sums=('5812070c2067f432835a0ee21ea63c30a3d540c6583bc0b4612151c96bd304d43ab5376b4c015061e3801e7e4c5f001bdc50abb5ed6eae260d905a91d91873d4')
b2sums=('67333a548985b5f9cec326e4c5c5ab14b0c4fe444ec78137f12590ef6c7a5b791ba9720af9d5cb65443f67c2c86acd202071bbac7cf1611af84354beecb4ee00')

prepare() {
  cd "devscripts-v$pkgver/scripts"

  sed "s/###VERSION###/$pkgver/g" checkbashisms.pl > checkbashisms
}

package() {
  cd "devscripts-v$pkgver/scripts"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "$pkgname"

  # man page
  install -vDm644 -t "$pkgdir/usr/share/man/man1" "$pkgname.1"

  # bash completions
  install -vDm644 "$pkgname.bash_completion" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
