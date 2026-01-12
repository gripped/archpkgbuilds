# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=checkbashisms
pkgver=2.26.4
pkgrel=1
pkgdesc='Debian script that checks for bashisms'
arch=(any)
url='https://tracker.debian.org/pkg/devscripts'
license=(GPL-2.0-or-later)
depends=(perl)
makedepends=(git)
source=("$pkgname::git+https://salsa.debian.org/debian/devscripts#tag=v$pkgver")
sha512sums=('301aac47d0e5127f935c77e1f3d79f3318a808b52972e18b5f881df1d9c9a69991c6a36add654d6f55ad4e1b74b76be6768d104edd002637b2fae74118eac112')
b2sums=('e1ae77fc5efed7da30c65705238ad1997df7bf9953376fd570ba908be7bed2906888bd076a2596dcf8a988d4131a7a7632c44054811d1798854b51ff4e6809b9')

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
