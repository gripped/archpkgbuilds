# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=checkbashisms
pkgver=2.26.11
pkgrel=1
pkgdesc='Debian script that checks for bashisms'
arch=(any)
url='https://tracker.debian.org/pkg/devscripts'
license=(GPL-2.0-or-later)
depends=(perl)
makedepends=(git)
source=("$pkgname::git+https://salsa.debian.org/debian/devscripts#tag=v$pkgver")
sha512sums=('ed8194e610f4f4d9290edf70badfd67afcffc297d33696bbec81be92a4aba91b8bfda6a101b4919f58440b4b500d82472926598d9a760a076a465f6790a852ec')
b2sums=('c41e0a2e57e58245a59c782cac26b17b26e1fd3c685ab808427e45794d286ae683f507278de2bc51197b6f68496da07f3d0bec1cdf1bfb9895c9ad19701ee177')

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
