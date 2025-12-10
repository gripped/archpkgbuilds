# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=checkbashisms
pkgver=2.25.30
pkgrel=1
pkgdesc='Debian script that checks for bashisms'
arch=(any)
url='https://tracker.debian.org/pkg/devscripts'
license=(GPL-2.0-or-later)
depends=(perl)
makedepends=(git)
source=("$pkgname::git+https://salsa.debian.org/debian/devscripts#tag=v$pkgver")
sha512sums=('5be91060fdf8fa3d11a99b5de9ed9ed4e207739e22cc0835dfffd773494fa12b6fe724e23768610d4f10f5e40ce09e69e637db4a759fc70c3b5a68bad6671e10')
b2sums=('7b5b3b7d0b6d3594e17261f3a3f7c6a36f5fcf2d3227675326c14160be00cfcb13fb7528fcd72d68fab251d0481f017c8a4eae99e5d1d7822bd48000364be9da')

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
