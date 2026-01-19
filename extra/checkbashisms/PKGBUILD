# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=checkbashisms
pkgver=2.26.5
pkgrel=1
pkgdesc='Debian script that checks for bashisms'
arch=(any)
url='https://tracker.debian.org/pkg/devscripts'
license=(GPL-2.0-or-later)
depends=(perl)
makedepends=(git)
source=("$pkgname::git+https://salsa.debian.org/debian/devscripts#tag=v$pkgver")
sha512sums=('bae62d225d375a3e87a7b1c1a9d18aaeaa28054a6f98e3d9973e254aabf974433d0ea48bcf18f0d9e3b43886b75fe63a22a51fbc70becb74748602bc5f193dc1')
b2sums=('c716e3266ab481f29bf921a8ddf2e5a4be283a4c41b0aeb0e5e03bf7f25bc9d75196b01191a2738d4d426e65bba9d590c24ba2f2dbe8fde93e7cc193b5565acf')

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
